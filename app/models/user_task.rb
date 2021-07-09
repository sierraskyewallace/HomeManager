class UserTask < ApplicationRecord
    belongs_to :task 
    belongs_to :user

    
    scope :most_tasks, -> { order(tasks_count: :desc) } 
    



    
end
