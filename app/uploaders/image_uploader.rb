# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/images/#{model.id}"
  end

  version :icon do
    process :resize_to_fill => [150, 150]
    # process :convert => 'jpg'
    # process :quality => 80

  end
end
