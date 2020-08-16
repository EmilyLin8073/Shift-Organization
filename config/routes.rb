Rails.application.routes.draw do
  root 'session#new'

  # Allow shifts route to do get, post, put and delete
  resources :shifts, only:[:index, :create, :update, :destroy]
  # Allow users routes to do post and put
  resources :users , except: [:new, :destroy]
  resources :organizations

  # Sign up route for user
  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
