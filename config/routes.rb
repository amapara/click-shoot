Rails.application.routes.draw do
  get 'messages/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :sale_items do
    resources :bookings
   end
   get '/dashboard', to: 'dashboards#show'
   #post '/sale_items/:id', to: 'dashboards#view'
   get 'pages/sell_w_us', to: 'pages#sell_w_us'

   get '/sale_items/new', to: 'sale_items#new'

   get '/dashboard/messages', to: 'messages#show'
end
