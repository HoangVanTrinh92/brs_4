Rails.application.routes.draw do
 
  devise_for :users
  root "static_pages#home"
  resources :users
  
  namespace :admin do    
    root 'users#index'
    resources :books
    resources :users
  end
end
