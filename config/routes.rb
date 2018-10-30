Rails.application.routes.draw do
  resources :merchants
  resources :customers
  devise_for :users

  root 'application#index'
  get '/merchant', to: 'merchants#index'
  get '/customer', to: 'customers#index' 

end
