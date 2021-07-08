class GroupsController < ApplicationController

    def index 
        
    end

    def edit 
    end

    def new
        @group = Group.find_by_id(params[:id])
        @group = current_user.groups.build
    end

    def create
        @group = Group.find_by_id(params[:id])
        @group = current_user.groups.build(group_params)
        if @group.save
            redirect_to @group 
        else 
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

    def set_group
    end

    def group_params 
        params.require(:group).permit(:name, :owner_id)
    end
end
