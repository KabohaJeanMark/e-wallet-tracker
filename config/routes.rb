Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "users#show"

  get 'my_transactions', to: 'entities#my_entities'

  resources :groups, only: [:index, :show, :new, :create]
  resources :entities, only: [:show, :new, :create, :my_entities]
  resources :users, only: [:show]
end
