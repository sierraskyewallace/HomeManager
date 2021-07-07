class Task < ActiveRecord::Base
    has_many :users
    belongs_to :user
  
    scope :completed, -> { where(completion_status: 'complete') }

  end