Rails.application.routes.draw do


  get 'profiles/show'

  devise_for :users, :controllers => { :registrations => :registrations }
  resources :users

  resources :events , only: [:index, :show ] do
    resources :comments, only: [:create, :destroy], module: :events
  end

  resources :ongs do
    resources :comments, only: [:create, :destroy], module: :ongs
    resources :events
  end

  root 'events#index'
end
