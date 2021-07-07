class Group < ApplicationRecord
    invitable named_by: :name
    
    #has_many :invites 
    has_many :users
    belongs_to :user
    
    accepts_nested_attributes_for :users, :invites
end
