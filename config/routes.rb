Rails.application.routes.draw do
  devise_for :user_auths
  root 'users#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  get 'static_pages/help'

  get 'static_pages/about'

  get 'static_pages/about'

  get 'static_pages/help'

  resources :users do
    resources :blogs
    resources :photos
    #match '/contacts', to: 'contacts#new', via: 'get'
    resources :contacts, only: [:new, :create]
    
  end
  
  resources :blogs do
    resources :comments
  end
  
  resources :comments do
    resources :replies
  end
  # resources :blogs
  # resources :albums
  # resources :comments
  # resources :replies
  
  
  
end
