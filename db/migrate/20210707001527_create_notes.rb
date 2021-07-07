class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :content
      t.integer :user_id 
      t.integer :notebook_id
      t.timestamps
    end
  end
end
