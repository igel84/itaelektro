# encoding: utf-8
class ProductUploader < CarrierWave::Uploader::Base

  include UploadImage

  version :thumb do
    process resize_to_fit: [83, 83]
  end

  version :small do
    process resize_to_fill: [223, 223]
  end

  version :medium do
    process resize_to_fit: [366, 366]
  end
  
end
