Rails.application.routes.draw do

  devise_for :users
  root "items#index"
  resources :users, only: [:edit, :update]
  resources :items, only: [:index, :new, :create, :show, :edit, :destroy]
  get 'item/:id', to: 'item#tax'
end
