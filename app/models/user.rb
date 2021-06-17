class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :recoverable,
  devise :invitable, :database_authenticatable, :registerable, :confirmable, :invitable,
          :rememberable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

         has_many :tasks, through: :teams
         
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
