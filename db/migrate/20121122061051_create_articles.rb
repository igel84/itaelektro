class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.string :name
      t.boolean :to_main_block
      t.text :body
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
