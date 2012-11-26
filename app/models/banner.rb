class Banner < ActiveRecord::Base
  attr_accessible :alt, :file_url, :image, :image_cache, :remove_image  
  mount_uploader :image, BannerUploader
end
