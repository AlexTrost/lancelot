class CreateFreelancerInformations < ActiveRecord::Migration
  def change
    create_table :freelancer_informations do |t|
      t.text :description
      t.string :location
      t.string :email
      t.string :phone
      t.string :skype
      t.string :website
      t.string  :attachment
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
