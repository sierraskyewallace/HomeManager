# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include Invitation::UserRegistration
  before_action :set_invite_token, only: [:new]
  after_action :process_invite_token, only: [:create]
  skip_before_action :verify_authenticity_token
  
  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user 
    else 
      redirect_to new_user_registration_url
    end
  end
end
  

