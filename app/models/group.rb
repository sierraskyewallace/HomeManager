class Group < ApplicationRecord
    has_many :tasks 
    has_many :users

    accepts_nested_attributes_for :users
end
