Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"
  
  resources :users do
    resources :favourites, only: [:index]
    resources :read_states, only: [:index]
  end
  
  namespace :admin do    
    root 'users#index'
    resources :books do
      resources :reviews
    end
    resources :users
  end

  resources :books do
    resources :reviews
  end

  resources :reviews do 
    resources :comments
  end

  resources :read_states
  resources :favourites, only: [:create, :destroy]

  resources :requests, only:[:create, :new]
end
