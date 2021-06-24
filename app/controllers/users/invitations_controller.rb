class Users::InvitationsController < Devise::InvitationsController


    def new
        @group = Group.find_by_id(params[:group_id])
        @user = @group.users.new
        @user.groups << @group
      end
    
      def create
        @group = Group.find_by_id(params[:group_id])
        @user = @group.users.new(group_user_params)
        @user.groups << @group
        @user.invite!
      end

    

      private

  def group_user_params
    params.require(:user).permit(:email,
      group_users_attributes: [:group_id])
  end
  end