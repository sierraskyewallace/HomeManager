class InvitesController < ApplicationController
    before_action :generate_token
    before_action :check_user_existence

def new
   @invite = Invite.new
    @token = params[:invite_token] 
 end
   
 def create
  @invite = Invite.new(invite_params)
  @invite.sender_id = current_user.id
  if @invite.save
    if @invite.recipient != nil 
       InviteMailer.existing_user_invite(@invite).deliver 
       @invite.recipient.user_groups.push(@invite.user_group)
    else
       InviteMailer.new_user_invite(@invite, new_user_registration_path(:invite_token => @invite.token)).deliver
    end
  else
     flash[:error] = "Invite failed" #think of better message
  end
end

private 

def check_user_existence
    recipient = User.find_by_email(params[:email])
   if recipient
      self.recipient_id = recipient.id
   end
 end

 

    def invite_params
        params.require(:invite).permit(:email)
    end
end
