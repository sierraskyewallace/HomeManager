class TasksController < ApplicationController
  before_action :set_task

    def index

      end
    
      def show

      end
    
      def new

      end
    
      def create
       
        end

        def edit

        end

        def update
        end

    

      def destroy

        end
    
      private
 
        def set_task
          @task = Task.find_by_id(params[:id])
        end


        def task_params
          params.require(:task).permit(:name)
        end
    end
    
