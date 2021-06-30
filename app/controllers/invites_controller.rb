class InvitesController < ApplicationController

   def index 
      @invite = Group.invites.all 
   end
def new
   @group = Group.find_by_id(params[:id])
   @invite = Group.invites.build
    @token = params[:invite_token] 
 end
   
 def create
   @invite = Group.invites.build(invite_params)
   @invite.sender_id = current_user.id
   if @invite.save
     if @invite.recipient != nil 
        InviteMailer.existing_user_invite(@invite).deliver 
        @invite.recipient.groups.push(@invite.group)
     else
        InviteMailer.new_user_invite(@invite, new_user_registration_path(:invite_token => @invite.token)).deliver
     end
   else
      render :new
   end
 end
 
 

private 



    def invite_params
      params.permit(:email, :group_id, :sender_id, :recipient_id, :token)
    end
end
