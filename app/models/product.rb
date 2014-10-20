class Product < ActiveRecord::Base

  # Attributes
  #
  # model
  # image
  # code
  # url
  # manufacturer
  #

  mount_uploader :image, ImageUploader

end
