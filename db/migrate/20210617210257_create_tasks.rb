class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :name 
      t.boolean :completed
      t.timestamps
    end
  end
end
