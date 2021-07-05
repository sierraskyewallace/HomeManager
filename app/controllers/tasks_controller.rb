class TasksController < ApplicationController
    def index
      @groups = Group.all
        @group = Group.find_by_id(params[:group_id])
        @tasks = @group.tasks
      end
    
      def show
        #@user = User.find_by_id(params[:id])
        @group = Group.find_by_id(params[:group_id])
        @task = Task.find_by_id(params[:id])
      end
    
      def new
        @group = Group.find_by_id(params[:group_id])
        @task = @group.tasks.build
        #@groups = Group.where('id = ?', current_user.group_id) ##change to model scope?
      end

      def edit
        @groups = current_user.groups
      end
    
      def create
        @task = Task.find_by_id(params[:task_id])
        @group = Group.find_by_id(params[:group_id])
        @task = @group.tasks.build(task_params)
          if @task.save
            redirect_to group_task_path(@group, @task)
          else
            render :new 
          end
        end

      def update

          if @task.update(task_params)
            redirect_to @task
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
          @task = Task.find_by_id(params[:id])
        end
    
       
        def task_params
          params.require(:task).permit(:name, :completed, :group_id, :user_id)
        end
    end
    
