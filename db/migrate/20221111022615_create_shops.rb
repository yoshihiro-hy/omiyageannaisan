class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name, null: false, limit: 255
      t.string :address, null: false
      t.string :photos
      t.string :tel_number, null: false
      t.string :url
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.references :rodging, null: false, foreign_key: true

      t.timestamps
    end
  end
end
