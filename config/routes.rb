Rails.application.routes.draw do
  resources :categories, only: [:show]
  resources :posts, only: [:show]

  root to: "home#index"
end
