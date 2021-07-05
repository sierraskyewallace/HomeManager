class Group < ApplicationRecord
    include CanCan::Ability
    invitable named_by: :name
    
    has_many :tasks
    has_many :group_members
    has_many :users, through: :group_members
    belongs_to :owner, class_name: 'User', optional: true

    

    accepts_nested_attributes_for :users, :invites

    validates :name, presence: true

    def accepted 
        Invite.accepted == true 
    end
end
