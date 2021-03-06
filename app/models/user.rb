class User < ApplicationRecord




  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :recoverable,
  devise  :database_authenticatable, :registerable,
          :rememberable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]
        
      has_many :user_tasks
      has_many :tasks, through: :user_tasks
      has_many :group_memberships, dependent: :destroy
      has_many :groups, through: :group_memberships

      

      validates :email, presence: true, uniqueness: true


        



         def self.from_omniauth(auth)
          where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.provider = auth.provider
          user.uid = auth.uid 
          user.email = auth.info.email
          user.password = Devise.friendly_token[0, 20] 
         end
        end 
end
