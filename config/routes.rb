Rails.application.routes.draw do


  get '/get_map', to: 'locations#get_map'

  get 'pages/index'

  get 'tags/:tag', to: 'events#index', as: :tag

  get 'profiles/show'

  devise_for :users, :controllers => { :registrations => :registrations }
  resources :users

  resources :events , only: [:index, :show ] do
    resources :comments, only: [:create, :destroy], module: :events

    member do
      get 'favorite'
      get 'participate'
    end

  end

  resources :ongs do
    resources :comments, only: [:create, :destroy], module: :ongs
    resources :events do
      member do
        get 'favorite'
        get 'participate'
      end
    end

    member do
      get 'favorite'
    end
  end

  # resources :tags, only: [:index, :show]

  root 'pages#index'
end
