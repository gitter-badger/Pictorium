Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :userpages, only: [:show, :edit, :update]
  resources :posts
  post '/posts/comment/:id', to: 'posts#create_comment' 
end
