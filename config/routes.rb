Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :sale_items do
    resources :bookings
   end
   get '/dashboard', to: 'dashboards#view'

   #intention: address of T&C page
   get 'pages/sell_w_us', to: 'pages#sell_w_us'

   #intention: create new listing with user upload
   post '/listings/create', to: 'listings#create'

   #intention: add newly created listing camera index w/ confirmation
   patch '/listing/:id', to: 'listings#index'
end
