class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:invite_token, group_attributes: [:group_id]])
  end 
end
