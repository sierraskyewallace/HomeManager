class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.integer :owner_id
      t.integer :user_id
      t.integer :invite_token
      t.string :name
      t.timestamps
    end
  end
end
