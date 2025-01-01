Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'login', to: 'auth#new'
  post 'login', to: 'auth#login'
  delete 'logout', to: 'auth#logout'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'me', to: 'users#show'
  patch 'me', to: 'users#update'
  get 'dashboard', to: 'dashboard#index'
  root 'dashboard#index'

  get 'plans', to: 'plans#show'

end
