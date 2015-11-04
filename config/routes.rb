Rails.application.routes.draw do
  get 'static_pages/help'

  get 'static_pages/about'

  get 'static_pages/about'

  get 'static_pages/help'

  resources :users
  root 'users#index'
  resources :blogs
  resources :albums
  resources :comments
  resources :replies
end
