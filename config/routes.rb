Rails.application.routes.draw do
  namespace :admin do
      resources :categories
      resources :tags
      resources :posts

      root to: "posts#index"
    end
  resources :categories, only: [:show]
  resources :posts, only: [:show]
  resources :users, only: [:create, :new]

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  root to: "home#index"
end
