class CreateTaskLists < ActiveRecord::Migration[6.1]
  def change
    create_table :task_lists do |t|
      t.integer :task_id 
      t.integer :list_id
      t.timestamps
    end
  end
end
