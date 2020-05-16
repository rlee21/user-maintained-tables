class AddAddressToUsers < ActiveRecord::Migration[5.2]
  def up
    rename_column :users, :name, :first_name
    add_column :users, :last_name, :string
    add_column :users, :billing_address, :string
    add_column :users, :shipping_address, :string
  end
  def down
    rename_column :users, :first_name, :name
    remove_column :users, :last_name, :string
    remove_column :users, :billing_address, :string
    remove_column :users, :shipping_address, :string
  end
end
