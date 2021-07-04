class GroupsController < ApplicationController
  before_action :owner?, only: [:new, :create, :update, :edit, :destroy]
    def index
        @user = User.all
        @groups = Group.all
        @groups = current_user.groups
      end

      def show
        @user = User.find_by_id(params[:id])
        @group = Group.find_by_id(params[:id])
          end
 
      def new
        @group = current_user.groups.build
        @user = current_user
      end

      def edit
      end
    
      def create
        @group = Group.find_by_id(params[:id])
        @group = current_user.groups.build(group_params)
        @group.users << current_user
          if @group.save
                redirect_to @group
          else 
            render :new 
          end
        end


        def update
            if @group.update(group_params)
                redirect_to @group
              else
                render :edit
              end
            end

          def destroy
            @group = Group.find_by_id(params[:id])
            @group.destroy
            redirect_to groups_path
            end

        
          private

            def set_group
              @group = Group.find(params[:id])
            end
            
            def owner?
              current_user.admin?
            end
        
            
            def group_params
              params.require(:group).permit(:name, :owner_id, users_attributes: [:id, :first_name, :email, :_destroy])
            end
          end