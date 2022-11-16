class CreateRodgings < ActiveRecord::Migration[7.0]
  def change
    create_table :rodgings do |t|
      t.timestamp :start_time
      t.timestamp :end_time
      t.timestamp :shopping_day
      t.string :address,           null: false
      t.string :photos
      t.string :tel_number
      t.string :url
      t.float :latitude
      t.float :longitude
      t.references :user,          null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
