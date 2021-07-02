class Group < ApplicationRecord
    invitable named_by: :name

    has_many :users
    has_many :tasks , through: :users
    belongs_to :user
 
end
