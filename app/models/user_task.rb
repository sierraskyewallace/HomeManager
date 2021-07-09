class UserTask < ApplicationRecord
    belongs_to :task 
    belongs_to :user


    scope :completed, -> { where(completed: true) }
end
