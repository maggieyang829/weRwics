Rails.application.routes.draw do
  resources :users
  root 'users#index'
  resources :blogs
  resources :albums
  resources :comments
  resources :replies
end
