Rails.application.routes.draw do
  
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  get 'getuser', to: 'users#get_user'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
