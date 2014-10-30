Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root controller: :static, action: :index
  get :enter, controller: :static, action: :enter
end
