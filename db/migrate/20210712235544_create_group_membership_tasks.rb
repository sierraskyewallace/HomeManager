class CreateGroupMembershipTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :group_membership_tasks do |t|
      t.integer :group_membership_id
      t.integer :task_id
      t.timestamps
    end
  end
end
