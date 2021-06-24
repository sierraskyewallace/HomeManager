class Users::InvitationsController < Devise::InvitationsController

    def edit
        sign_out send("current_#{resource_name}") if send("#{resource_name}_signed_in?")
        set_minimum_password_length
        resource.invitation_token = params[:invitation_token]
        redirect_to "http://localhost:8080/users/invitation/accept?invitation_token=#{params[:invitation_token]}"
      end
    
      def update
        super do |resource|
          if resource.errors.empty?
            render json: { status: "Invitation Accepted!" }, status: 200 and return
          else
            render json: resource.errors, status: 401 and return
          end
        end
      end
      
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