class Task < ApplicationRecord
    belongs_to :list
    #belongs_to :user
    belongs_to :team
    has_many :users, through: :teams
    validates :name, presence: true
end
