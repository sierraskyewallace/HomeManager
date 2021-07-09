class UserTask < ApplicationRecord
    belongs_to :task 
    belongs_to :user


    scope :complete, -> { where(complete: true) }
    scope :incomplete, -> { where(complete: false) }
end
