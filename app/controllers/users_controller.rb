class UsersController < Devise::RegistrationsController
    include Invitation::UserRegistration
    before_action :set_invite_token, only: [:new]
    after_action :process_invite_token, only: [:create]

 
end