class Task < ApplicationRecord
    belongs_to :user
    has_many :users, through: :user_tasks
end
