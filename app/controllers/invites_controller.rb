class InvitesController < ApplicationController
   
    def create
        @invite = Invite.new(invite_params) 
        @invite.sender_id = current_user.id 
        if @invite.save
           InviteMailer.new_user_invite(@invite, new_user_registration_path(:invite_token => @invite.token)).deliver #send the invite data to our mailer to deliver the email
        else
            #something
        end
end
