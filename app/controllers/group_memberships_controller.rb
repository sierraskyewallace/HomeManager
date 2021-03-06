class GroupMembershipsController < ApplicationController
    skip_before_action :authenticate_user!, only: :new
  
    def new
        if user_signed_in?
          create
        else
          redirect_to new_user_registration_path(invite_token: params[:group_invite_token])
        end
      end
    
      def create
        group = Group.find_by_invite_token(params[:group_invite_token])
        GroupMembership.where(group: group, user: current_user).first_or_create
        redirect_to groups_path
      end
    end
  
