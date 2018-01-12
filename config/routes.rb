Rails.application.routes.draw do
  
  
  resources :products
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  get 'getuser', to: 'users#get_user'

  resources :users do 
    resources :cart_items, shallow: true
  end

  get 'get_cart_item', to: 'cart_items#get_cart'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
