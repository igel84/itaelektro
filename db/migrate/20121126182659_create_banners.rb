class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :image
      t.string :alt
      t.string :file_url
      t.timestamps
    end
  end
end
