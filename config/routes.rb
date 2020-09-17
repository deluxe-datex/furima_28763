Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root "items#index"
  resources :users, only: [:edit, :update]
  resources :items do
    resources :trading_histories, only: [:index, :create]
  end
  get 'item/:id', to: 'item#tax'
end
