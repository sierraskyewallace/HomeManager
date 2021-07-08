class InvitesController < ApplicationController

    def create
      @invite = Invite.new(invite_params)
      @invite.sender_id = current_user.id
      if @invite.save
        if @invite.recipient != nil 
           InviteMailer.existing_user_invite(@invite).deliver 
           @invite.recipient.groups.push(@invite.organization)
        else
           InviteMailer.new_user_invite(@invite, new_user_registration_path(:invite_token => @invite.token)).deliver
        end
      else
        #else something
      end
    end

    private 

    def invite_params
        params.require(:invite).permit(: group_id, :email)
  end
  end