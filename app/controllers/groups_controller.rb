class GroupsController < ApplicationController
    before_action :set_group
    def index 
        @groups = Group.all
    end

    def new 
        @group = Group.new 
    end

    def edit 
    end

    def show 
    end

    def create 
        @group = Group.new(group_params)
        if @group.save 
            redirect_to @group 
        else
            render :new 
        end
    end

    def update
    end

    def destroy 
    end

    
    private

    def set_group 
        @group = Group.find_by_id(params[:id])
    end

    def group_params 
        params.require(:group).permit(:name)
    end
end
