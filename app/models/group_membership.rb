class GroupMembership < ActiveRecord::Base
  groupify :group_membership
  belongs_to :group
  belongs_to :user
end
