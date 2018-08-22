Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root "products#index"

  get "favorite", to: "users#favorite"
  resources :comments, except: [:index, :show]
  resources :products
  resources :users
end
