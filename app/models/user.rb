class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

         has_many :user_lists
         has_many :lists, through: :user_lists
         
         def self.from_omniauth(auth)
          where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.provider = auth.provider
          #user.name = auth.info.name
          user.uid = auth.uid 
          user.email = auth.info.email 
          user.password = Devise.friendly_token[0, 20] 
         end
        end
end
