Rails.application.routes.draw do

  get 'profiles/show'

  devise_for :users

  resources :users

  resources :events , only: [:index, :show ]

  resources :ongs do
    resources :events
  end

  root 'events#index'
end
