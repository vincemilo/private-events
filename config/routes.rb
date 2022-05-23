Rails.application.routes.draw do
  devise_for :users
  root 'events#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :events, only: [:index, :show, :new, :create]
  resources :attended_events, only: [:create]
  # Defines the root path route ("/")
  # root "articles#index"
end
