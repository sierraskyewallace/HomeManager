class Group < ApplicationRecord
    has_secure_token :invite_token
    has_many :group_memberships, dependent: :destroy
    has_many :users, through: :group_memberships
    belongs_to :owner, class_name: "User"


    def member?(user)
        users.include?(user)
    end

    def to_param 
        invite_token
    end
    #has_many :invites

    #accepts_nested_attributes_for :users, :invites
end
