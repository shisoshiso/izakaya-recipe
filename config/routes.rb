Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users
  root 'recipes#index'
  
  resources :users, only: :show
  resources :relationships, only: [:create, :destroy]

  resources :recipes do
    resources :comments, only: :create
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end

end