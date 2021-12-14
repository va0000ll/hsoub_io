class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :description, :text
    add_column :users, :country, :string
    add_column :users, :language, :stirng
    add_column :users, :gender, :string
    add_column :users, :birth_date, :date
  end
end
