Rails.application.routes.draw do
  root to: 'articles#index'
  devise_for :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :articles do
    resources :comments
  end
end
