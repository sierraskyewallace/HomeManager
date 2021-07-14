class Group < ApplicationRecord
    has_secure_token :invite_token
    
    has_many :group_memberships, dependent: :destroy
    has_many :users, through: :group_memberships
    
    has_many :tasks, dependent: :destroy
    
    
   
    
    #associate tasks to users
    def members 
   
    end

    def member?(user)
        users.include?(user)
    end

    def to_param 
        invite_token
    end


end
