Rails.application.routes.draw do
  get 'event_attendings/create'
  devise_for :users
  root 'events#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :events, :event_attendings
  resources :users, only: [:index, :show]
  # Defines the root path route ("/")
  # root "articles#index"
end
