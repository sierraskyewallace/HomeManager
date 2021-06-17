class GroupsController < ApplicationController
    def index
        @groups = Group.all
      end

      def show
      end
 
      def new
        @group = current_user.groups.build
        @user = current_user
      end

      def edit
      end
    
      def create
        @group = current_user.groups.build(group_params)
        @group.users << current_user

          if @group.save
                redirect_to root_path
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
          end

          def destroy
            @group.destroy
            redirect_to root_path
            end

        
          private

            def set_group
              @group = Group.find(params[:id])
            end
        
            
            def group_params
              params.require(:group).permit(:name, users_attributes: [:id, :first_name, :email, :_destroy])
            end
        end
    end
