class AddAddrToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :city, :string
    add_column :orders, :state, :string
    add_column :orders, :country, :string
    add_column :orders, :address1, :string
    add_column :orders, :zip, :string
  end
end
