Rails.application.routes.draw do
  root 'users#new'

  # Allow shifts route to do get, post, put and delete
  resources :shifts, only:[:index, :create, :update, :destroy]
  # Allow users routes to do post and put
  resources :users , only:[:create, :update]

  # Sign up route
  get "signup", to: "users#new"
  resources :organizations, only:[:index, :create, :update, :destroy]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
