Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :posts
  resources :comments
  resources :communities
  resources :links
  resources :topics
  resources :users
end
