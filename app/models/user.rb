class User < ApplicationRecord


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :recoverable,
  devise  :database_authenticatable, :registerable, :invitable,
          :rememberable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]
          
        has_one :owned_group, class_name: 'Group', :foreign_key => 'owner_id'
        
        has_many :memberships
        has_many :groups, through: :memberships
        
        has_many :user_tasks
        has_many :tasks, through: :user_tasks


         def self.from_omniauth(auth)
          where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.provider = auth.provider
          user.uid = auth.uid 
          user.email = auth.info.email
          user.password = Devise.friendly_token[0, 20] 
         end
        end 
end
