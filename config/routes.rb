# Rails.application.routes.draw do
#   get 'books/index'

#   get "up" => "rails/health#show", as: :rails_health_check

#   get '/about', to: 'pages#about', as: 'about'

#   resources :books
#   root 'books#index'

#   resources :books, only: [:show]

#   resources :authors

#   resources :publishers

#   resources :books do
#     collection do
#       get 'search'
#     end
#   end


# end
Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  get '/about', to: 'pages#about', as: 'about'

  get 'books/search', to: 'books#search', as: 'books_search'

  resources :books

  resources :authors
  resources :publishers

  root 'books#index'
  resources :books do
    collection do
      get 'search', to: 'books#search'
    end
  end

end
