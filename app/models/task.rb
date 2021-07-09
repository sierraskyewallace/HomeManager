class Task < ApplicationRecord
    belongs_to :user#, counter_cache: true
    has_many :user_tasks
    has_many :users, through: :user_tasks

    validates :name, presence: true
    validates :user_id , presence: true

    
end
