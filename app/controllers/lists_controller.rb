class ListsController < ApplicationController
    def index 
        @lists = List.all #render lists, change to current user asp
    end

    def show 
    end

    def edit
    end

    def new 
    end

    def create 
    end

    def update
    end

    def destroy 
    end


    private

    def set_list 
    end

    def list_params 
    end
end
