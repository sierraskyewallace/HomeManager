class Task < ApplicationRecord
    belongs_to :list
    belongs_to :user
 
    validates :name, presence: true, uniqueness: true
end
