Rails.application.routes.draw do
  get 'comments/create'
  root 'home#index'
  devise_for :users
  resources :posts do
    resources :comments
  end
  resources :communities
  resources :links
  resources :topics
  resources :users
end
