class Group < ApplicationRecord
    invitable named_by: :name
    
    has_many :group_members
    has_many :users, through: :group_members
    #has_many :tasks
    
    accepts_nested_attributes_for :users, :invites
end
