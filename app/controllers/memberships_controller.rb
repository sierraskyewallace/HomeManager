class MembershipsController < ApplicationController

    def destroy 
        @group = Group.find(params[:group_id])
        @membership = Membership.find(params[:id])
        @membership.destroy
        redirect_to @group
    end
end
