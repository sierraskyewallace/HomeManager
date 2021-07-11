class GroupifyMigration < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string     :type
      t.string    :name
      t.integer   :owner_id
      t.timestamps
    end

    create_table :group_memberships do |t|
      t.references :member, polymorphic: true, index: true, null: false
      t.references :group, polymorphic: true, index: true
      t.integer :user_id
      # The named group to which a member belongs (if using)
      t.string     :group_name, index: true

      # The membership type the member belongs with
      t.string     :membership_type

      t.timestamps
    end
  end
end
