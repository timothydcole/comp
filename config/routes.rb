Rails.application.routes.draw do
  resources :merchants
  resources :customers
  resources :charges
  devise_for :users

  root 'application#index'
  get '/merchant', to: 'merchants#index'
  get '/customer', to: 'customers#index'
  get '/search', to: 'merchants#search'

end
