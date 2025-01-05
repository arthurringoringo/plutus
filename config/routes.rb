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

  get 'plans', to: 'plans#index'
  post 'plans', to: 'plans#create'
  get 'plan', to: 'plans#show'

  post 'incomes',to: 'plans#add_income'
  delete 'income', to: 'plans#delete_income'

  post 'expense',to: 'plans#add_expense'
  delete 'expense', to: 'plans#delete_expense'

end
