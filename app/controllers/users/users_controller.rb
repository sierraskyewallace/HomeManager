class Users::UsersController < Devise::RegistrationController 
    def create
        @invited_user = build_user(user_params)
        @invited_user.save
        @token = params[:invite_token]
        if @token != nil
           group =  Invite.find_by_token(@token).group #find the group attached to the invite
           @invited_user.groups.push(group) #add this user to the new group as a member
        else
          # do normal registration things #
        end
      end
    end
