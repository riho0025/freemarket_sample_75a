Rails.application.routes.draw do

  
  devise_for :users

  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :items, only: [:index, :new, :show]
  resources :profiles, only: [:index, :new, :show]
  
end
