class Group < ApplicationRecord
    invitable named_by: :name
    has_many :tasks 
    has_many :users
    
    #accepts_nested_attributes_for :invites
end
