Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users
  resources :characters
  # get '/characters' => 'characters#index'
end
