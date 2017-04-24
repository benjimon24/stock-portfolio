Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :portfolios

  root 'portfolios#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
