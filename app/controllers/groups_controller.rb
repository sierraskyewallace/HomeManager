class GroupsController < ApplicationController
    before_action :set_group
    def index
        @groups = current_user.groups
      end
    
      def show

      end

    def new 
        @group = current_user.groups.build
    end

    def create 
        @group = current_user.groups.build(group_params)
        @group.group_memberships.build(user_id: current_user.id)
        if @group.save!
            redirect_to @group
            flash[:success] = "Group was successfully created."
        else
            flash[:danger] = "Group could not be created."
            render :new
        end
    end

    def edit 

    end

    def update
        if @group.update(group_params)
            redirect_to @group
            flash[:danger] = "Group was successfully updated."
        else
            flash[:error] = "Group could not be updated."
            render :edit
        end
    end

    def destroy 
        @group.destroy
        redirect_to groups_path

    end


    private 

    def set_group 
        @group = Group.find_by_invite_token(params[:invite_token])
    end

    def group_params 
        params.require(:group).permit(:name, :user_id, users_attributes: [:id, :email, :_destroy])
    end
end