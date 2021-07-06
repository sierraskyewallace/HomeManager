class TasksController < ApplicationController
  before_action :set_task

    def index
      @lists = List.find_by_id(params[:list_id])
      @tasks = Task.all
    end

    def show 
      @task = current_user.tasks
      @list = List.find_by_id(params[:list_id])
    end

    def new 
      @list = List.find_by_id(params[:list_id])
      @task = current_user.tasks.build
    end
    
    def create
      @list = List.find_by_id(params[:list_id])
      #@task = Task.find_by_id(params[:id])
       @task = current_user.tasks.build(task_params)
          if @task.save 
            redirect_to @task 
          else 
            render :new 
          end
        end

    def edit
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
    redirect_to tasks_path
   end
    
      private
 
   def set_task
     @task = Task.find_by_id(params[:task_id])
   end


   def task_params
      params.require(:task).permit(:name)
      end
    end
    
