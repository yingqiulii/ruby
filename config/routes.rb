Rails.application.routes.draw do
  get 'books/index'

  get "up" => "rails/health#show", as: :rails_health_check

  get '/about', to: 'pages#about', as: 'about'

  resources :books
  root 'books#index'

  resources :books, only: [:show]

  resources :authors

  resources :publishers


end
