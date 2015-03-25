Rails.application.routes.draw do
 
  devise_for :users
  root "home#index"
  
  namespace :admin do
    root 'users#index'
    resources :books
  end
end
