Rails.application.routes.draw do
  
  resources :books
  resources :users
  resources :categories
  resources :circulates
  resources :tags

end
