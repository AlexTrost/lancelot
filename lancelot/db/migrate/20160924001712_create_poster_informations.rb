class CreatePosterInformations < ActiveRecord::Migration
  def change
    create_table :poster_informations do |t|
      t.text :description
      t.string :location
      t.string :email
      t.string :phone
      t.string :skype
      t.string :website
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
