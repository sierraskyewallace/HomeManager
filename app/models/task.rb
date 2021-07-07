class Task < ActiveRecord::Base
    has_many :users
    belongs_to :user_task
  
    scope :complete, -> { where(completion_status: 'complete') }

  end