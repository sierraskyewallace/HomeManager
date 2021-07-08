class Group < ApplicationRecord
    has_many :group_members
    has_many :users, through: :group_members

    belongs_to :owner, class_name: "User"

    accepts_nested_attributes_for :owner

    def owner?
        current_user.id == owner.id
    end
end
