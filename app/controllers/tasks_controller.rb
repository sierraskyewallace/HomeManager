class TasksController < ApplicationController
  before_action :set_task

    def index
        @user_tasks = Task.where(user_id: current_user.id)
        @tasks = Task.all
      end
    
    def show 
        @task = Task.find_by_id(params[:id])
      end

      def new 
        @group = Group.find_by_invite_token(params[:group_invite_token])
         @task = Task.new
      end
      
      def create
        @group = current_user.groups
        @task = Task.new(task_params)
        if @task.save
          redirect_to @task
        else
          render 'new'
        end
      end
      
      def edit
        @task = Task.find_by(params[:id])
      end

      def update 
        @task = Task.find_by(params[:id])
        if @task.update(task_params)
          redirect_to @task
        else 
          render :edit 
        end
      end
    
      def destroy
        @task = Task.find_by_id(params[:id])
        @task.destroy
        redirect_to tasks_path
      end

    

      private


      def set_task 
        @task = Task.find_by_id(params[:id])
      end
      
      def task_params
        params.require(:task).permit(:name, :user_id)
      end
    end
    

