Rails.application.routes.draw do


  get 'profiles/show'

  devise_for :users

  resources :users

  resources :events , only: [:index, :show ] do
    # member do
    #   post 'create_comment'
    #   delete 'delete_comment/:id'
    # end
  end

  resources :ongs do
    member do
      post 'create_comment', as: :comment
      delete 'delete_comment/:comment_id', to: 'ongs#delete_comment', as: 'delete_comment'
    end

    resources :events
  end

  root 'events#index'
end
