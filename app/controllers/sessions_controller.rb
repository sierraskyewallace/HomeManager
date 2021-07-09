class SessionsController < ApplicationController
   
    def home 
        @users = User.invitation_accepted 
        
    
    end
end
