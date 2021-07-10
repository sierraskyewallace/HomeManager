class GroupsController < ApplicationController

    def index 
        @groups = Group.all
    end

    def show 
    end

    def new 
        @group = current_user.groups.build
    end

    def create 
        @group = current_user.groups.build(group_params)
        if @group.save
            redirect_to @group
            flash[:notice] = "Group was successfully created."
        else
            flash[:error] = "Group could not be created."
            render :new
        end
    end

    def edit 
    end

    def update
    end

    def destroy 
    end


    private 

    def set_group 
        @group = Group.find_by_id(params[:group_id])
    end

    def group_params 
        params.require(:group).permit(:name, :type)
    end
end