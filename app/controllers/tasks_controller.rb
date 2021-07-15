class TasksController < ApplicationController
  before_action :set_task
  

    def index
        @group = Group.find_by_invite_token(params[:group_invite_token])
        @tasks = @group.tasks
        @user_tasks = @group.tasks.where(user_id: current_user.id)
    end
    
    def show 
        @task = Task.find_by_id(params[:id])
        @users = User.find_by_id(params[:user_id])
      end

      def new 
        @group = Group.find_by_invite_token(params[:group_invite_token])
        @task = @group.tasks.create

        
      end
      
      def create
        @group = Group.find_by_invite_token(params[:group_invite_token])
        @task = @group.tasks.create(task_params)
         if @task.save!  
      
          redirect_to group_task_path(@group, @task)
        else
          render 'new'
        end
      end
      
      def edit
        @group = Group.find_by(params[:group_invite_token])
        @task = Task.find_by(params[:id])
      end

      def update 
        @group = Group.find_by(params[:group_invite_token])
        @task = Task.find_by(params[:id])
        if @task.update(task_params)
          redirect_to group_task_path(@group, @task)
        else 
          render :edit 
        end
      end
    
      def destroy
        @group = Group.find_by(params[:group_invite_token])
        @task = Task.find_by_id(params[:id])
        @task.destroy
        redirect_to group_tasks_path(@group, @task)
      end

    

      private


      def set_task 
        @task = Task.find_by_id(params[:id])
      end
      
      def task_params
        params.require(:task).permit(:name, :user_id, users_attributes: [:id, :email, :_destroy])
      end
    end
    

