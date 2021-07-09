class Group < ApplicationRecord
    has_many :memberships
    has_many :users, through: :memberships

    belongs_to :owner, class_name: "User"

    accepts_nested_attributes_for :owner, :users

    validates :name, presence: true, uniqueness: true
    validates :owner, presence: true

    def owner?
        current_user.id == owner.id
    end
end
