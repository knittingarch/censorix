Rails.application.routes.draw do
  resources :categories, only: [:show]
  resources :posts, only: [:show]
  resources :users, only: [:create, :new]

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"

  root to: "home#index"
end
