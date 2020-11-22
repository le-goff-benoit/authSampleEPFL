Rails.application.routes.draw do

  root 'home#index'

  get 'home/index'

  get 'home/login'

  get 'home/logout'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
