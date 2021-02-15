Rails.application.routes.draw do
  devise_for :users
  root 'recipes#index'
  resources :recipes
  resources :recipes do
    resources :comments, only: :create
  end
end
