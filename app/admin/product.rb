ActiveAdmin.register Product do
  permit_params :id, :model, :image, :code, :url, :manufacturer
  menu false
end
