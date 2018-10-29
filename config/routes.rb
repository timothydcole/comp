Rails.application.routes.draw do
  resources :merchants
  resources :customers
  devise_for :users

  root 'application#index'

end
