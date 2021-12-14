Rails.application.routes.draw do
  get 'users/show'
  get 'comments/create'
  root 'home#index'
  devise_for :users
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
