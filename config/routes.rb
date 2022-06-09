Rails.application.routes.draw do
  get 'event_attendings/create'
  get 'attended_events/create'
  devise_for :users
  root 'events#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :events
  resources :event_attendings, only: [:new, :create, :destroy]
  resources :users, only: [:index, :show]
  # Defines the root path route ("/")
  # root "articles#index"
end
