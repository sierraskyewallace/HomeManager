class GroupsController < ApplicationController
    before_action :owner?, only: [:new, :create, :update, :edit, :destroy]

    def index 
        
    end

    def edit 
    end

    def new
        @user = current_user
        @group = Group.new
    end

    def create
        @group = Group.new(group_params)
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
        #add users here 
    end

    def destroy
    end

    def show
    end

    private 

    def owner?
        @owner == current_user
    end

    def set_group
    end

    def group_params 
        params.require(:group).permit(:name, :owner_id, users_attributes: [:id, :email, :_destroy])
    end
end
