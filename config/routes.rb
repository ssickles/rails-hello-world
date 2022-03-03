Rails.application.routes.draw do
  resource :home, only: [:show]
  resources :documents, only: [:index, :create]
  resources :logs, only: [:index, :create]
  resource  :redshift, controller: :redshift, only: [:show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#show"
end
