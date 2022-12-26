class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :line_user_id, :string
    add_index :users, :line_user_id, unique: true
  end
end
