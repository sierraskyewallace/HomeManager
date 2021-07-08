class Membership < ApplicationRecord
    belongs_to :group
    belongs_to :user

    #add enum roles?
end
