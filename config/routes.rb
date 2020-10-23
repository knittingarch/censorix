Rails.application.routes.draw do
  resources :category, only: [:index, :show]

  root to: "home#index"
end
