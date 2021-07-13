class TasksController < ApplicationController
  before_action :set_task
  

    def index
        #show tasks of current group members 
        @group = Group.find_by(params[:invite_token])
        @group_membership = GroupMembership.find_by(group_id: @group.id, user_id: current_user.id)
        @tasks = @group_membership.tasks
      end
    
    def show 
        @task = Task.find_by_id(params[:id])
      end

      def new 
        @group = Group.find_by_id(params[:group_id])
        @task = Task.new
        
      end
      
      def create
        

        if @task.save
          redirect_to 
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
    

