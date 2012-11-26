class CreateCatalogueSections < ActiveRecord::Migration
  def self.up
    create_table :catalogue_sections do |t|
      t.string :name
      t.timestamps      
    end
  end

  def self.down
    drop_table :catalogue_sections
  end
end
