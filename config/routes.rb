Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create,:show] do
    resources :items, only: :index
end
resources :users, only: :show
end
