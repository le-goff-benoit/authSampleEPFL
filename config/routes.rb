Rails.application.routes.draw do

  root 'home#index'
  get 'home/index'

  resources :users, only: [:create, :show] do
    resources :reviews
  end
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
