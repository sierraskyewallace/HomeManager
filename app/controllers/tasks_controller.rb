class TasksController < ApplicationController
    def index
        @group = Group.find_by_id(params[:group_id])
        @tasks = @group.tasks
      end
    
      def show
        @user = User.find_by_id(params[:id])
        @task = Task.find_by_id(params[:id])
      end
    
      def new
        @group_member = GroupMember.find_by_email(params[:email])
        @group_members = GroupMember.all
        @group = Group.find_by_id(params[:group_id])
        @task = @group.tasks.build
        #@groups = Group.where('id = ?', current_user.group_id) ##change to model scope?
      end

      def edit
        @groups = current_user.groups
      end
    
      def create
        @group = Group.find_by_id(params[:id])
        @task = Group.tasks.build(task_params)
    
          if @task.save
            redirect_to @task
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
          @task = Task.find(params[:id])
        end
    
       
        def task_params
          params.require(:task).permit(:name, :description, :group_id)
        end
    end
    
