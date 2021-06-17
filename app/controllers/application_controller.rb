class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    def after_sign_in_path_for(resource)
        redirect_to root_path
    end
end
