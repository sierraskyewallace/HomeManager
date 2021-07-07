class User < ApplicationRecord
  include Invitation::User

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :recoverable,
  devise  :database_authenticatable, :registerable, 
          :rememberable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]
          
          
          has_many :tasks
          has_many :notebooks
          has_many :notes, through: :notebooks  
          has_many :group_members
          has_many :groups, through: :group_members
          
         def self.from_omniauth(auth)
          where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.provider = auth.provider
          user.uid = auth.uid 
          user.email = auth.info.email
          user.password = Devise.friendly_token[0, 20] 
         end
        end 
end
