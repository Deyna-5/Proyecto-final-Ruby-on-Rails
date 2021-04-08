Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  resources :products, only: [:show, :new, :create, :edit, :update, :destroy]

  get 'update/:id', to: 'users#become_admin', as: 'become_admin'
  delete "user/:id", to: "users#destroy", as: "delete_user"
  
  get "dashboard", to: "dashboard#index", as: "dashboard"

  #Root Path solo para pruebas momentaneas
  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
