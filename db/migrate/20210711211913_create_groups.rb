class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :invite_token

      t.timestamps
    end
    add_index :groups, :invite_token, unique: true
  end
end
