Rails.application.routes.draw do
  root 'flights#index'
  resources :flights
  devise_for :users, path: '/', path_names: {
    sign_up: 'register',
    sign_in: 'login',
    sign_out: 'logout'
  }

  post '/book/:id', to: 'users#book', as: 'booking'

  # resources :<controller_name>

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
