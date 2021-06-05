class CompletedTasksController < ApplicationController
    def complete
        @task = Task.find(params[:id])
        @task.complete!
      end
end
