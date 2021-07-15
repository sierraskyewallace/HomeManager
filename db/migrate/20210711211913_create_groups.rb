class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :invite_token
      t.integer :user_id
      t.timestamps
    end
    add_index :groups, :invite_token, unique: true
    add_index :groups, :id, unique: true
  end
end
