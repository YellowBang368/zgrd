Rails.application.routes.draw do
  resources :product_attachments
  devise_for :users, controllers: { registrations: "registrations" }
  root "products#index"

  post "get_pro", to: "users#get_pro"
  get "favorite", to: "users#favorite"
  post "add_favorite", to: "users#add_favorite"
  delete "remove_favorite", to: "users#remove_favorite"
  resources :comments, except: [:index, :show]
  resources :products
  resources :estates
  resources :users


  resources :conversations do
    resources :messages
  end
end
