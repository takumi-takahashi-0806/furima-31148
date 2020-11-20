Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do  
   #resources :users, only: :show
    resources :orders, only: [:create, :index]
  end
end
