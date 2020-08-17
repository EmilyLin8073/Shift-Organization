Rails.application.routes.draw do
  root 'sessions#new'

  resources :users , except: [:new, :destroy]

  # Set up sign up route for user
  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :organizations do
    member do
      # Set up custom routes for the organization
      get "join"
      get "leave"
    end
  end

  resources :shifts



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
