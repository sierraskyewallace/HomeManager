class ListsController < ApplicationController
    before_action :set_list
    def index
      @lists = current_user.lists
        @list = List.new
        #@lists = List.all
      end
    
      def show
        @task = Task.new
      end
    
      def new 
        @list = List.new
        @list.tasks.build
      end

      def edit  
        @list = List.find_by_id(params[:id])
        #@list = current_user.lists.update(update_params)
      end

      def update 
        @list = List.find_by_id(params[:id])
        if @list.update(list_params)
        redirect_to list_path(@list)
        else 
          render :edit 
        end
      end
    
      def create
        @list = current_user.lists.new(list_params)
        if @list.save
          redirect_to @list
        else
          render :new
        end
      end
    
      def destroy
        @list.destroy
        redirect_to lists_path
      end
    
      private


      def list_params
        params.require(:list).permit(:name, tasks_attributes: [:name, :completed])
      end

      def set_list 
        @list = current_user.lists.find_by_id(params[:id])
      end
end
