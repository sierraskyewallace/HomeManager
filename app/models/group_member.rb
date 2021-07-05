class GroupMember < ApplicationRecord
    belongs_to :group 
    belongs_to :user
    has_many :tasks

    enum role: [:general, :admin]

    
end
