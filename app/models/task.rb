class Task < ApplicationRecord
    belongs_to :user
    belongs_to :group
    has_many :user_tasks
    
    accepts_nested_attributes_for :user


    validates :name, presence: true

    scope :most_recent, -> { order(created_at: :desc) }

    
end
