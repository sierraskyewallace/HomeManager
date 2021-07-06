class TasksController < ApplicationController
  before_action :set_task

    def index
      @lists = List.find_by_id(params[:list_id])
      @tasks = Task.all
    end

    def show 
      @task = Task.find_by_id(params[:id])
      @list = List.find_by_id(params[:list_id])
    end

    def new 
      @list = List.find_by_id(params[:list_id])
      @task = @list.tasks.build
    end
    
    def create
      @list = List.find_by_id(params[:list_id])
       @task = @list.tasks.build(task_params)
          if @task.save 
            redirect_to list_task_path(@list, @task)
          else 
            render :new 
          end
        end

    def edit
      @list = List.find_by_id(params[:list_id])
      @task = Task.find_by_id(params[:id])
    end

   def update
    @list = List.find_by_id(params[:list_id])
    @task = Task.find_by_id(params[:id])
    if @task.update(task_params)
      redirect_to list_task_path(@task)
    else 
      render :edit 
    end
   end

    

   def destroy
    @task = Task.find_by_id(params[:id])
    @task.destroy 
    redirect_to list_tasks_path
   end
    
      private
 
   def set_task
     @task = Task.find_by_id(params[:task_id])
   end


   def task_params
      params.require(:task).permit(:name)
      end
    end
    
