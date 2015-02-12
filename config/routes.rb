Rails.application.routes.draw do
  resource :session, only: [:new,:create, :destroy]

  resources :users, only: [:new, :create, :show] do
    collection do
      get :activate
    end
  end

  resources :bands

  resources :albums, except: :index

  resources :tracks, except: :index

  resources :notes, only: [:create, :destroy]

  root 'sessions#new'
end
