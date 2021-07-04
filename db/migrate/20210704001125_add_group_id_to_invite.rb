class AddGroupIdToInvite < ActiveRecord::Migration[6.1]
  def change
    add_column :invites, :group_id, :integer
  end
end
