class List < ApplicationRecord
    has_many :tasks
    belongs_to :user

    accepts_nested_attributes_for :tasks
end
