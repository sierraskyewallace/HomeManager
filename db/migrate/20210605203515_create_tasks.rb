class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name 
      t.integer :user_id
      t.integer :list_id
      t.timestamps
    end
  end
end
