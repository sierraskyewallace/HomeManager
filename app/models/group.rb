class Group < ApplicationRecord
    has_many :tasks 
    has_many :users
    #has_many :users, through: :tasks

    accepts_nested_attributes_for :users
end
