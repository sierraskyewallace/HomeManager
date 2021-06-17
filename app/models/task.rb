class Task < ApplicationRecord
    belongs_to :list
    belongs_to :user
    has_many :users, through: :teams
    validates :name, presence: true
end
