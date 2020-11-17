Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create,:show,:index,:edit,:update,:destroy] 
    
  resources :users, only: :show
end
