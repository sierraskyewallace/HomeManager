class List < ApplicationRecord
  has_many :tasks
  belongs_to :user

  validates_presence_of :name, uniqueness: true

  accepts_nested_attributes_for :tasks
end
