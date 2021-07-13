class GroupMembership < ApplicationRecord
    belongs_to :group
    belongs_to :user
    has_many :group_membership_tasks, dependent: :destroy
    has_many :tasks, through: :group_membership_tasks

end
