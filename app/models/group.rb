class Group < ApplicationRecord
    has_many :tasks 
    has_many :users, through: :user_groups
    has_many :invites
    accepts_nested_attributes_for :users
end
