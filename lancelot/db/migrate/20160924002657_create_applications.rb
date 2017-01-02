class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.boolean :hourly
      t.references :freelancer_information, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.text :description
      t.integer :amount
      t.string :payment_protection
      t.boolean :acknowledged, default: false
      t.integer :weekly_hours
      t.string :payment_interval
      t.timestamps null: false
      t.datetime :project_start
      t.datetime :project_end
    end
  end
end
