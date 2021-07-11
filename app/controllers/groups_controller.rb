class GroupsController < ApplicationController

    def index 
        @groups = Group.all
        #show groups current user is a member of
        @groups = @groups.where(:user_id => current_user.id)
    end

    def show 
        @group = Group.find_by_id(params[:id])
    end

    def new 
        @group = current_user.groups.build
    end

    def create 
        @group = current_user.groups.build(group_params)
        @group.owner = current_user
        if @group.save!
            redirect_to @group
            flash[:notice] = "Group was successfully created."
        else
            flash[:error] = "Group could not be created."
            render :new
        end
    end

    def edit 
        @group = Group.find_by_id(params[:id])
    end

    def update
        @group = Group.find_by_id(params[:id])
        if @group.update(group_params)
            redirect_to @group
            flash[:notice] = "Group was successfully updated."
        else
            flash[:error] = "Group could not be updated."
            render :edit
        end
    end

    def destroy 
        @group = Group.find_by_id(params[:id])
        @group.destroy

        redirect_to groups_path

    end


    private 

    def set_group 
        @group = Group.find_by_id(params[:group_id])
    end

    def group_params 
        params.require(:group).permit(:name, :type, :user_id)
    end
end