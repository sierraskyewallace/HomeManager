class GroupMember < ApplicationRecord
    belongs_to :user 
    belongs_to :group
    has_many :tasks, through: :groups
end
