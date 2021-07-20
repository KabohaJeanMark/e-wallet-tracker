Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "users#show"

  resources :groups
  resources :entities
  resources :users, only: [:show]
end
