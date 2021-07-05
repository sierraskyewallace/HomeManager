class AddEmailToGroupMembersTable < ActiveRecord::Migration[6.1]
  def change
    add_column :group_members, :email, :string
  end
end
