class Task < ApplicationRecord
    belongs_to :user
    belongs_to :group
    has_many :user_tasks
    
    accepts_nested_attributes_for :user


    validates :name, presence: true

    scope :completed, -> { where(completed: true) }
    scope :incomplete, -> { where(completed: false) }
    
    def complete
        @task = current_user.tasks.find(params[:id])
        @task.completed = true
        @tasks.save
        redirect_to current_user
      end
     
      def incomplete
       @tasks = current_user.tasks.find(params[:id])
       @tasks.completed = false
       @tasks.save
       redirect_to current_user
     end

    
end
