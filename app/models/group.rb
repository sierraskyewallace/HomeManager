class Group < ActiveRecord::Base
  groupify :group, members: [:users, :tasks], default_members: :users
  invitable named_by: :name
  
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  has_many :group_memberships, dependent: :destroy
  has_many :users, through: :group_memberships

  validates :name, presence: true, uniqueness: true
  validates :owner, presence: true
end
