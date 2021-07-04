class GroupMember < ApplicationRecord
    belongs_to :group 
    belongs_to :user

    enum role: [:general, :admin]

    has_many :invites
end
