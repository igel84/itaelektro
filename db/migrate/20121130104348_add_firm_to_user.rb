class AddFirmToUser < ActiveRecord::Migration
  def change
    add_column :users, :firm, :string
    add_column :users, :ogrn, :string
  end
end
