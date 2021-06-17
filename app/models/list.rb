class List < ApplicationRecord

  belongs_to :user
  has_many :tasks

  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :tasks
end
