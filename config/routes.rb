Rails.application.routes.draw do
  resources :categories, only: [:show]
  resources :posts, only: [:show]
  resources :users, only: [:create, :new]

  root to: "home#index"
end
