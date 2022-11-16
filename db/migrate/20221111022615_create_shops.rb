class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :address, null: false
      t.string :photos
      t.string :tel_number
      t.string :url
      t.float :latitude
      t.float :longitude
      t.references :rodging, null: false, foreign_key: true

      t.timestamps
    end
  end
end
