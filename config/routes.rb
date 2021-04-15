Rails.application.routes.draw do
  
  resource :comments, only: [:new, :create, :destroy]
  resource :contacts, only: [:new, :create]
  delete "contacts/:id", to: "contacts#destroy", as: "contact"

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: "users/registrations",
    sessions: "users/sessions"
  }
  get "user/show", to: "users#show", as: "user"

  resource :cart, only: [:show, :update] do
    member do
      post :pay_with_paypal
      get :process_paypal_payment
    end
  end
  delete 'cart/:item_id/remove', to: 'carts#destroy', as: 'destroy_cart_item'

  resources :products, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :likes
  end

  get 'update/:id', to: 'users#become_admin', as: 'become_admin'
  delete "user/:id", to: "users#destroy", as: "delete_user"
  
  get "dashboard", to: "dashboard#index", as: "dashboard"

  root "home#index"
end
