Rails.application.routes.draw do
  


  devise_for :users
  resources :users, only: [:show, :update] do
    resources :items, only: [:create]
  end

  get "welcome/index", as: 'home'
  get "welcome/about", as: 'about'

  root to: 'users#show'
  
end
