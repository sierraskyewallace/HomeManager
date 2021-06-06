class Task < ApplicationRecord
    belongs_to :list
    belongs_to :user_list

    validates_presence_of :name
end
