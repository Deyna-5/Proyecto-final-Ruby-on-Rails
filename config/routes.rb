Rails.application.routes.draw do
  resources :products, only: [:show, :new, :create, :edit, :update, :destroy]
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  get "dashboard", to: "dashboard#index", as: "dashboard"

  #Root Path solo para pruebas momentaneas
  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
