class Group < ApplicationRecord
    belongs_to :owner, class_name: "User"
    has_many :memberships
    has_many :members, through: :memberships, source: :user
    
    accepts_nested_attributes_for :members
end
