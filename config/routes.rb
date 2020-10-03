Rails.application.routes.draw do
  root to: 'articles#index'
  devise_for :users
  resources :users 
  resources :articles do
    resources :comments
  end
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
end
