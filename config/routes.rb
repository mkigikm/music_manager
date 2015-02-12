Rails.application.routes.draw do
  resource :session, only: [:new,:create, :destroy]

  resources :users, only: [:new, :create, :show]

  resources :bands

  resources :albums, except: :index

  resources :tracks, except: :index

  root 'sessions#new'
end
