class List < ApplicationRecord
  belongs_to :user 
  has_many :tasks, through: :users

  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :tasks
end
