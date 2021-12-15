Rails.application.routes.draw do
  mount Notifications::Engine => "/notifications"
  namespace :admin do
    resources :users
    resources :comments
    resources :communities
    resources :links
    resources :posts
    resources :topics

    root to: 'users#index'
  end
  get 'users/show'
  get 'comments/create'
  get '/go/:id', to: 'posts#show'
  root 'home#index'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :posts do
    resources :comments
    member do
      post :vote
    end
  end
  resources :communities
  resources :links
  resources :topics
  resources :users
  resources :u, controller: 'users' do
    resources :comments, except: :index
    get 'comments', to: 'comments#user_comments'
  end
end
