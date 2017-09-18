Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  resources :posts do
    member do
      get 'show_image'
    end
  end
end
