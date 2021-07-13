class AddGroupMembershipIdToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :group_membership_id, :integer
  end
end
