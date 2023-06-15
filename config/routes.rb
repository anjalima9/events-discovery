Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'homes#home'
  # Defines the root path route ("/")
  get '/profil/:id', to: 'users#index', as: :profil
  get '/profil/:id/edit', to: 'users#edit', as: :edit_profil
  patch '/profil', to: 'users#update', as: :update_profil

  #session
  get '/login', to: 'sessions#new', as: :new_session
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: :destroy_session


  get '/search', to: 'events#search'

  get '/registration/:id', to: 'registrations#destroy', as: :registration

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  resources :events, only: [:edit, :new, :index, :show, :create, :update, :destroy]

  resources :registrations, only: [:new, :create]

end
