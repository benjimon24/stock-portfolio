Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :portfolios
  resources :stocks, only: [:new, :show]

  get 'stocks/:id/buy', to: 'stocks#new', as: 'new'
  post 'stocks/:id/buy', to: 'stocks#buy', as: 'buy'

  get 'stocks/:id/sell', to: 'stocks#sell', as: 'sell'
  put 'stocks/:id/sell', to: 'stocks#update', as: 'update'

  post 'stocks/search', to: 'stocks#search', as: "search"
  root 'portfolios#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
