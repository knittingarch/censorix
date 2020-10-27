Rails.application.routes.draw do
  resources :categories, only: [:index, :show]
  resources :posts, only: [:show]

  root to: "home#index"
end
