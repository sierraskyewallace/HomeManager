class Task < ApplicationRecord
    belongs_to :user
    belongs_to :group_member
   
    
    validates :name, presence: true
end
