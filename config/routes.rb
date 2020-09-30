Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root 'places#index'
  resources :places do
    collection do
      get 'search'
    end
    resources :items
  end
end
