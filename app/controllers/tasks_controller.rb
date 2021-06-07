class TasksController < ApplicationController
    before_action :set_task
    def index
        @task = Task.all
      end

    def new 
      #@list = List.find_by_id(params[:id])
      @task = @list.tasks.build
    end

      def create
        @list = List.find(params[:list_id])
        @task = @list.tasks.build(task_params)
        @task.save
        redirect_to list_path(@list)
      end
      
      def show 
        @task = Task.find(params[:id])
      end

      def edit
        @list = List.find(params[:list_id])
        @task = Task.find_by_id(params[:id])
      end

      def update 
        @task.update(task_params)
        @task.save 
        redirect_to list_task_path
      end

      def destroy
        @task.destroy
        redirect_to list_path(@task.list)
      end
    
      private
      
      def task_params
        params.require(:task).permit(:name)
      end
      def set_task 
        @task = Task.find_by_id(params[:id])
      end
    end
