class Task < ApplicationRecord
    belongs_to :list
    has_many :users, through: :lists
    validates :name, presence: true
end
