class CreateUserTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :user_tasks do |t|
      t.references :user, null: false
      t.references :task, null: false
      t.timestamps
    end
  end
end
