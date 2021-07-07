class GroupsController < ApplicationController
    before_action :set_group
    def index 
        @groups = current_user.groups
        @user = User.all 
    end

    def edit 
    end

    def show
        @user = User.find_by_id(params[:id])
        @user = User.all
    end

    def new 
        @group = Group.find_by_id(params[:group_id])
        @group = current_user.groups.build
    end

    def create
        @group = current_user.groups.build(group_params)
        @group.users << current_user
        if @group.save
            redirect_to @group 
        else 
            render :new 
        end
    end

    def update
        @group = Group.find_by_id(params[:id])
        if @group.update(group_params)
            redirect_to @group 
        else 
            render :new 
        end
    end

    def destroy
        @group.destroy 
        redirect_to groups_path
    end


    private 

    def set_group
        @group = Group.find_by_id(params[:id])
    end

    def group_params
        params.require(:group).permit(:name, users_attributes: [:id, :first_name, :email, :_destroy])
    end
end
