class CreateMenuItems < ActiveRecord::Migration
  def self.up
    create_table :menu_items do |t|
      t.string :name
      t.string :url
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth
      t.timestamps
    end    
  end

  def self.down
    drop_table :menu_items
  end
end
