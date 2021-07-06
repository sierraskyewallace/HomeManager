class TasksController < ApplicationController
  before_action :set_task

    def index
      @tasks = Task.all
    end

    def show 
    end

    def new 
      @task = Task.new 
    end
    
    def create
       @task = Task.new(task_params)
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
     @task = Task.find_by_id(params[:id])
   end


   def task_params
      params.require(:task).permit(:name)
      end
    end
    
