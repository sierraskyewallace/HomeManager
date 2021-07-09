class CreateUserTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :user_tasks do |t|
      t.integer :user_id 
      t.integer :task_id
      t.boolean :completed
      t.timestamps
    end
  end
end
