Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'static_pages#home'
  devise_for :users
  resources :characters
  # get '/characters' => 'characters#index'
end
