Rails.application.routes.draw do
  resources :documents, only: [:index, :create]
  resources :logs, only: [:index, :create]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
