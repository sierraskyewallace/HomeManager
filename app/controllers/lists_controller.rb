class ListsController < ApplicationController
    before_action :set_list 
    before_action :auth
    
    def index 
        @lists = current_user.lists 
    end

    def show 
        @task = Task.find_by_id(params[:id])
    end

    def edit
    end

    def new 
        @list = current_user.lists.build
    end

    def create 
        @list = current_user.lists.build(list_params)
        if @list.save 
            redirect_to @list 
        else 
            render :new 
        end
    end

    def update
        @list = List.find_by_id(params[:id])
        if @list = List.update(list_params) 
            redirect_to list_path(@list) 
        else 
            render :edit 
        end
    end

    def destroy 
        @list.destroy 
        redirect_to lists_path
    end


    private

    def auth 
        current_user == true
    end

    def set_list
        @list = List.find_by_id(params[:id]) 
    end


    def list_params 
        params.require(:list).permit(:name)
    end
end
