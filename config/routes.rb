Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#index"

  resources :events
  resources :products, only: [:edit, :update, :destroy]

  resources :users, only: [:show] do
    resources :products, only: [:new, :create]
    resources :orders, only: [:new, :create, :show, :destroy]
  end

  resources :orders, only: [:edit, :update, :destroy] do
    resources :product_orders, only: [:new, :create, :edit, :destroy]
  end

  resources :user_events, only: [:create, :destroy]

  namespace :api do
    namespace :v1 do
      resources :events, only: [:index, :show]
      resources :user_events, only: [:index]
    end
  end
end
