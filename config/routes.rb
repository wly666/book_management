Rails.application.routes.draw do

  resources :books do
    collection do
      get :success
    end
  end
  resources :users
  resources :categories
  resources :circulates do
    collection do
      get :tongji
      get :usersTongji
    end
  end
  resources :tags
  resources :sessions
  resources :mains

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root to: "mains#index"
end
