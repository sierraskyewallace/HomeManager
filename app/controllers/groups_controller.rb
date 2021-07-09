class GroupsController < ApplicationController
    before_action :owner?, only: [:new, :create, :update, :edit, :destroy]

    def index 
        
    end

    def edit 
        
        #@user = current_user
        @group = Group.find(params[:id])
    end

    def new
        @user = current_user
        @group = Group.new
    end

    def create
        @group = Group.new(group_params)
        @group.users << current_user
        @group.owner = current_user
        if @group.save
            flash[:success] = "Group created"
            redirect_to @group
        else
            flash[:danger] = "Error creating group"
            render :new
        end
    end


    def update
        @user = User.invitation_accepted
        @group = Group.find(params[:id])
        @group.users << @user unless @group.users.include?(@user)
        if @group.update(group_params)
            flash[:success] = "Group updated"
            redirect_to @group
        else
            flash[:danger] = "Error updating group"
            render :edit
        end
    end

    def destroy
    end

    def show
        @group = Group.find(params[:id])
    end

    private 

    def owner?
        @owner == current_user
    end

    def set_group
    end

    def group_params 
        params.require(:group).permit(:name, :user_id, :owner_id, users_attributes: [:id, :email, :_destroy], usership_attributes: [:id, :group_id, :user_id, :_destroy])
    end
end
