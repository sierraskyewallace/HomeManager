class Group < ApplicationRecord
    has_many :tasks 
    has_many :users
    has_many :invites
    #accepts_nested_attributes_for :invites
end
