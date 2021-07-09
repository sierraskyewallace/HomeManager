class Task < ApplicationRecord
    belongs_to :user
    has_many :user_tasks
    has_many :users, through: :user_tasks

    validates :name, presence: true
    validates :user_id , presence: true

    
    default_scope -> { order('created_at DESC') }
    scope :completed, where(:completed =>true)
    scope :incomplete, where(:completed =>false)

    
end
