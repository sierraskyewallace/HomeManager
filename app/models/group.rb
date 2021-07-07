class Group < ApplicationRecord
    invitable named_by: :name
    has_many :invites 
    has_many :users, through: :invites 
end
