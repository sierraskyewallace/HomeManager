class Group < ApplicationRecord
    has_many :memberships
    has_many :members, through: :memberships, source: :user

    belongs_to :owner, class_name: "User"

    accepts_nested_attributes_for :owner, :members

    def owner?
        current_user.id == owner.id
    end
end
