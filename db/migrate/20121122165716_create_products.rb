class CreateProducts < ActiveRecord::Migration
  
  def self.up
    create_table :products do |t|
      t.string :title
      t.string :name
      t.string :brand
      t.string :kod
      t.integer :catalogue_section_id
      t.text :top_product_attributes
      t.text :bottom_product_attributes
      t.decimal :price
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end

end
