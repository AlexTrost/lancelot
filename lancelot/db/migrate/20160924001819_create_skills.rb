class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :title
      t.string :years
      t.references :freelancer_information, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
