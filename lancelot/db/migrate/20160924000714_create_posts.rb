class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.references :poster_information
      t.integer :awarded_to_id
      t.integer :budget
      t.boolean :hourly
      t.timestamps null: false
    end
  end
end
