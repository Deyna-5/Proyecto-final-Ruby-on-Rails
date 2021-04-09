Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  resource :cart, only: [:show, :update]
  resources :products, only: [:show, :new, :create, :edit, :update, :destroy]

  get 'update/:id', to: 'users#become_admin', as: 'become_admin'
  delete "user/:id", to: "users#destroy", as: "delete_user"
  
  get "dashboard", to: "dashboard#index", as: "dashboard"

  root "home#index"
end
