class Group < ActiveRecord::Base
  groupify :group, members: [:users, :tasks], default_members: :users
  invitable named_by: :name
  belongs_to :user 
  has_many :group_memberships, dependent: :destroy
  has_many :users, through: :group_memberships

end
