Rails.application.routes.draw do
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  resources :users, only: %i(new create show)

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :password_resets, only: %i(new create edit update) 
  resources :account_activations, only: :edit
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
