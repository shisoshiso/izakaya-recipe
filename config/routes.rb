Rails.application.routes.draw do
  root 'recipes#index'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :passwords => 'users/passwords',
    :sessions => 'users/sessions'
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users, only: :show
  resources :relationships, only: [:create, :destroy]

  get '/recipes/searchrecipe', to: "recipes#search_recipe"
  resources :recipes do
    resources :comments, only: :create
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end

end