class AddColumnToRodgings < ActiveRecord::Migration[7.0]
  def change
    add_column :rodgings, :user_uid, :string
  end
end
