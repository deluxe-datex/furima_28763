Rails.application.routes.draw do

  devise_for :users
  root "items#index"
  resources :users, only: [:edit, :update]
  resources :items do
    resources :trading_histories, only: [:index, :create]
  end
  get 'item/:id', to: 'item#tax'
end
