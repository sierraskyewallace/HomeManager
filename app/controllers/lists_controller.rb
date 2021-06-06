class ListsController < ApplicationController
    before_action :set_list
    def index
        @list = List.new
        @lists = List.all
      end
    
      def show
        @task = Task.new
      end
    
      def new 
        @list = List.new
        @list.tasks.build
      end
    
      def create
        @list = List.new(list_params)
        if @list.save
          redirect_to @list
        else
          render :new
        end
      end
    
      def destroy
        #@list = List.find_by(params[:id])
        @list.destroy
        redirect_to lists_path
      end
    
      private
    
      def list_params
        params.require(:list).permit(:name, tasks_attributes: [:name, :completed])
      end
      def set_list 
        @list = List.find_by_id(params[:id])
      end
end
