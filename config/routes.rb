Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'

  resources :userpages, only: [:show, :edit, :update]

  resources :posts do
    member do
      get 'show_image'
    end
  end
end
