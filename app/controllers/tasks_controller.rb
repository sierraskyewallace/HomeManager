class TasksController < ApplicationController

    def index 
        @group = Group.find_by_id(params[:group_id])
        @tasks = @group.tasks
    end

    def new
        @group = Group.find_by_id(params[:group_id])
        @task = @group.tasks.build
      end
    
      def create
        @group = Group.find_by_id(params[:group_id])
        @task = Task.find_by_id(params[:task_id])
        @task = @group.tasks.build(task_params)
          if @task.save
            redirect_to group_task_path(@group, @task)
          else
            render :new 
          end
        end

        def edit
          @task = Task.find_by_id(params[:id])
          @group = Group.find_by_id(params[:group_id])
        end

      def update
        @group = Group.find_by_id(params[:group_id])
        @task = Task.find_by_id(params[:id])
          if @group.tasks.update(task_params)
            redirect_to group_task_path(@group, @task)
          else
            render :edit 
          end
        end

    

      def destroy
        @task.destroy
        redirect_to root_path
        end
    
      private
 
        def set_task 
        end

        def set_group
        end
       
        def task_params
          params.require(:task).permit(:name, :completed, :group_id, :user_id)
        end
    end