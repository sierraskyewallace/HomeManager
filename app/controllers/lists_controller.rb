class ListsController < ApplicationController
    before_action :set_list

    def index
        @list = List.new
        @lists = List.all
      end
    
      def show
        @list = List.find_by_id(params[:id])
        @task = Task.find_by_id(params[:id])
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

      def edit 
        @list = List.find_by_id(params[:id])

      end

      def update 
        if @list.update(list_params)
          redirect_to @list
        else 
          render :edit 
        end
      end
    
      def destroy
        @list = List.find_by_id(params[:id])
        @list.destroy
        redirect_to lists_path
      end
    
      private

      def set_list 
        @list = List.find_by_id(params[:id])
      end
    
      def list_params
        params.require(:list).permit(:name, tasks_attributes: [:name, :status])
      end
    end    

