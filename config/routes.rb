Rails.application.routes.draw do
  resources :product_attachments
  devise_for :users, controllers: { registrations: "registrations" }
  root "products#index"

  post "get_pro", to: "users#get_pro"
  post "update_status", to: "users#update_status"
  get "favorite", to: "users#favorite"
  resources :comments, except: [:index, :show]
  resources :products
  resources :estates
  resources :users


  resources :conversations do
    resources :messages
  end
end
