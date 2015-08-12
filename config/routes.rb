Rails.application.routes.draw do
  
  devise_for :users
  resources :users, only: [:show, :update] do
    resources :items, only: [:create, :destroy]
  end

  get "welcome/index", as: 'home'
  get "welcome/about", as: 'about'

  root to: 'welcome#index'

end
