class AddAcceptedBooleanToInvitesTable < ActiveRecord::Migration[6.1]
  def change
    add_column :invites, :accepted, :boolean => default: false 
  end
end
