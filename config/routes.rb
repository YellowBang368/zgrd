Rails.application.routes.draw do
  resources :product_attachments
  devise_for :users, controllers: { registrations: "registrations" }
  root "products#index"

  post "get_pro", to: "users#get_pro"
  post "update_status", to: "users#update_status"
  get "favorite_products", to: "users#favorite"
  post "favorite", to: "users#add_to_favorite"
  post "unfavorite", to: "users#remove_from_favorite"
  post "change_currency", to: "application#change_currency"
  post "change_locale", to: "application#change_locale"

  get "/estates/:id/estate_products", to: "estates#show_products"
  resources :comments, except: [:index, :show]
  resources :products
  resources :estates
  resources :users


  resources :conversations do
    resources :messages
  end
end
