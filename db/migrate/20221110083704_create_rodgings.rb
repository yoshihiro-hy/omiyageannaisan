class CreateRodgings < ActiveRecord::Migration[7.0]
  def change
    create_table :rodgings do |t|
      t.string :name, null: false, limit: 255
      t.timestamp :start_time,     null: false
      t.timestamp :end_time,       null: false
      t.timestamp :shopping_day,   null: false
      t.string :address,           null: false
      t.string :photos
      t.string :tel_number,        null: false
      t.string :url
      t.float :latitude,           null: false
      t.float :longitude,          null: false
      t.references :user,          null: false, foreign_key: true

      t.timestamps                 null: false
    end
  end
end
