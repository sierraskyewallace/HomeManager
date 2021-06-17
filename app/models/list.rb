class List < ApplicationRecord
  belongs_to :user 
  belongs_to :task

  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :tasks
end
