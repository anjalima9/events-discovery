Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get '/profil', to: 'users#index', as: :profil
  get '/profil/edit', to: 'users#edit', as: :edit_profil
  patch '/profil', to: 'users#update'

  #session
  get '/login', to: 'sessions#new', as: :new_session
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :destroy_session

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
end
