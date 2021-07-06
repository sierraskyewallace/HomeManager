class Group < ApplicationRecord
    devise :invitable
    has_many :group_members
end
