class Task < ActiveRecord::Base
    has_many :users
    belongs_to :user_task
  
    scope :completed, -> { where(completion_status: 'complete') }

  end