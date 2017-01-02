class CreateContract < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
    	t.references :post
    	t.references :application
    	t.boolean :hourly
      t.integer :amount
      t.string :payment_protection
      t.boolean :freelancer_signed, default: false
      t.boolean :poster_signed, default: false
      t.boolean :freelancer_approved, default: false
      t.boolean :poster_approved, default: false
      t.integer :weekly_hours
      t.string :payment_interval
      t.datetime :project_start
      t.datetime :project_end
      t.timestamps
    end
  end
end
