class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.boolean :hourly
      t.references :freelancer_information, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.text :description
      t.integer :amount
      t.string :payment_protection

      t.timestamps null: false
    end
  end
end
