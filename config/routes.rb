Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create,:show] 
    resources :items, only: :index
    
resources :users, only: :show
end
