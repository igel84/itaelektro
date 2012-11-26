# encoding: utf-8
class BannerUploader < CarrierWave::Uploader::Base

  include UploadImage

  process resize_to_fit: [926, 236]
  
end