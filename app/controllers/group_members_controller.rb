class GroupMembersController < ApplicationController 
    def destroy 
        @group_member = GroupMember.find_by_id(params[:id])
        @group_member.destroy 
    end
end