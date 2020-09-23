Rails.application.routes.draw do
  devise_for :users
  root 'places#index'
  resources :places do
    resources :items,only: [:create,:destroy]
  end
end
