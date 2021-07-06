class GroupMembersController < ApplicationController
    def index 
        @group = Group.find_by_id(params[:group_id])
        @group_members = @group.group_members
    end
end
