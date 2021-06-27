class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :recoverable,
  devise  :database_authenticatable, :registerable, 
          :rememberable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]
          
          has_many :user_groups
          has_many :groups, through: :user_groups
          has_many :tasks
          has_many :invitations, :class_name => "Invite", :foreign_key => 'recipient_id'
          has_many :sent_invites, :class_name => "Invite", :foreign_key => 'sender_id'
         #validates :email, presence: true
         
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
