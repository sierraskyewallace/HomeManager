class Task < ApplicationRecord
    #belongs_to :user
    belongs_to :group_member
   
    #accepts_nested_attributes_for :groups
    #validates :name, presence: true
end
