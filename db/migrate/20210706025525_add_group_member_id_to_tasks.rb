class AddGroupMemberIdToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :group_member_id, :integer
  end
end
