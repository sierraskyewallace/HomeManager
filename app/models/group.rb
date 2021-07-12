class Group < ApplicationRecord
    invitable named_by: :name
    has_many :group_memberships
    has_many :users, through: :group_memberships, dependent: :destroy
    belongs_to :owner, class_name: "User"

    has_many :invites

    accepts_nested_attributes_for :users, :invites
end
