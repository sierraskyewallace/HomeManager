class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.boolean :admin 
      t.integer :user_id
      t.timestamps
    end
  end
end
