class UsersController < ApplicationController
    def invite_member
        user = User.find(params[:user_id])
        invite = GroupMember.new(user_id: params[:user_id], group_id: params[:group_id], status: "pending")
        if invite.save
          redirect_to user, notice: "Invite sent."
        else
          redirect_to user, notice: "Either something went wrong, or this user is already in that group. Please try again later."
        end
      end
    
      def invites
      end
    
      def accept_invite
        invite = GroupMember.find(params[:id])
        invite.status = "Accepted"
        if invite.save
          redirect_to invite.group, notice: "You've joined #{invite.group.name}."
        else
          redirect_to invites_path, notice: "An error occured, please try again later."
        end
      end
end