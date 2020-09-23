Rails.application.routes.draw do
  devise_for :users
  resources :items, only: :index
  #get 'items', to: 'items#index'
end
