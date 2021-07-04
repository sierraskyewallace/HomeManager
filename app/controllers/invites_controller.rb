class InvitesController < ApplicationController 
    def create
        @invite = Invite.new(invite_params)
        @invite.sender_id = current_user.id
        if @invite.save
          if @invite.recipient != nil 
             InviteMailer.existing_user_invite(@invite).deliver 
             @invite.recipient.groups.push(@invite.group)
          else
             InviteMailer.new_group_invite(@invite, new_user_registration_path(:invite_token => @invite.token)).deliver
          end
        else
           render :new 
        end
      end
    
      def new
         @group = Group.find_by_id(params[:group_id])
         @invite = Invite.new
        @token = params[:invite_token]
     end

     private 

     def invite_params 
      params.require(:invite).permit!
     end
end 