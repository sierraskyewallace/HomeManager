class NotebooksController < ApplicationController
    
    def index 
        @notebooks = current_user.notebooks 
    end

    def show 
        @notebook = Notebook.find_by_id(params[:id])
    end

    def edit 
    end 

    def create 
    end 

    def update
    end

    def destroy 
    end

    private

    def set_notebook 
    end

    def notebook_params 
    end
    
end
