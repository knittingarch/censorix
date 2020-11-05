Rails.application.routes.draw do
  resources :categories, only: [:show]
  resources :posts, only: [:show]
  resources :users, only: [:new, :create]

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"

  root to: "home#index"
end
