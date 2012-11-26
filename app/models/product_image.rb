class ProductImage < ActiveRecord::Base
  attr_accessible :image, :image_cache, :remove_image
  belongs_to :product
  mount_uploader :image, ProductUploader
end
