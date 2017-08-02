Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#index"
  resources :events, only:[:index, :show, :new, :create]
  resources :users, only: [:show] do
    resources :products, only: [:new, :create]
  end
  resources :products, only: [:edit, :update, :destroy]
  resources :user_events, only: [:create]
end
