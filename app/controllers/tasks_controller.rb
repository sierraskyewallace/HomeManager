class TasksController < ApplicationController
  before_action :set_task
  before_action :set_group
  

    def index
        @tasks = @group.tasks
        @user_tasks = @group.tasks.where(user_id: current_user.id)
    end
    
    def show 
        @users = User.find_by_id(params[:user_id])
      end

      def new 
        @task = @group.tasks.create
      end
      
      def create
        @task = @group.tasks.create(task_params)
         if @task.save!  
      
          redirect_to group_task_path(@group, @task)
        else
          render 'new'
        end
      end
      
      def edit
      end

      def update 
        @task = Task.find_by(params[:id])
        if @task.update(task_params)
          redirect_to group_task_path(@group, @task)
        else 
          render :edit 
        end
      end
    
      def destroy
        @task.destroy
        redirect_to group_tasks_path(@group, @task)
      end

    

      private

      def set_group 
        @group = Group.find_by_invite_token(params[:group_invite_token])
      end

      def set_task 
        @task = Task.find_by_id(params[:id])
      end
      
      def task_params
        params.require(:task).permit(:name, :user_id, users_attributes: [:id, :email, :_destroy])
      end
    end
    

