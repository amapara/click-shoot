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

   get 'pages/listing_confirmation', to: 'pages#listing_confirmation'
end
