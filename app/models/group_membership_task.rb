class GroupMembershipTask < ApplicationRecord
    belongs_to :group_membership
    belongs_to :task 
end