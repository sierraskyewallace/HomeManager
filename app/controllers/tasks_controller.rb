class TasksController < ApplicationController
  before_action :set_task

    def index
        @task = Task.all
      end
    
    def show 
      #@list = List.find_by_id(params[:list_id])
        @task = Task.find_by(params[:id])
      end

      def new 
      end
      
      def create
        @list = List.find(params[:list_id])
        @task = @list.tasks.build(task_params)
        @task.save
        redirect_to @list
      end
      
      def edit
        @list = List.find_by(params[:list_id])
        @task = Task.find_by(params[:id])
      end

      def update 
        if @task.update(task_params)
          redirect_to list_task_path(@task)
        else 
          render :edit 
        end
      end
    
      def destroy
        @task = Task.find_by(params[:id])
        @task.destroy
        redirect_to list_path(@task, @list)
      end
    
      private

      def set_task 
        @task = Task.find_by_id(params[:id])
      end
      
      def task_params
        params.require(:task).permit(:name, :completed)
      end
    end
    

