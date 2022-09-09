Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  root "splashs#index"

  resources :splashs, only: [:index]
  resources :users
  resources :groups, only: [:index, :new, :create] do
    resources :performances, only: [:index, :new, :create]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
