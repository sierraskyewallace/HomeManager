class UserTask < ApplicationRecord
    belongs_to :task 
    belongs_to :user

    
    default_scope -> { order('created_at DESC') }
    scope :completed, -> { where(completed: true) }
    scope :incomplete, -> { where(completed: false) }

    def complete
        @task = current_user.tasks.find(params[:id])
        @task.completed = true
        @task.save
        redirect_to current_user
      end
     
      def incomplete
       @task = current_user.tasks.find(params[:id])
       @task.completed = false
       @task.save
       redirect_to current_user
     end

    
end
