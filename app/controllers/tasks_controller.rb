class TasksController < ApplicationController
  before_action :set_task
  

    def index
        @group = Group.find_by(params[:invite_token])
        @user = @group.users.find_by(params[:user_id])
        @tasks = @user.tasks
        


      end
    
    def show 
        @task = Task.find_by_id(params[:id])
      end

      def new 
        @group = Group.find_by(params[:invite_token])
        @task = @group.tasks.build
      end
      
      def create
        @group = Group.find_by(params[:invite_token])
        @task = @group.tasks.build(task_params)
        
         if @task.save!  
          #redirect to the group page
          redirect_to @group
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
        params.require(:task).permit(:name, :user_id, group_membership_attributes: [:id, :group_id, :user_id])
      end
    end
    

