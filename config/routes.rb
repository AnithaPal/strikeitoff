Rails.application.routes.draw do

  devise_for :users
  get "welcome/index", as: 'home'

  get "welcome/about", as: 'about'

  root to: 'welcome#index'
end
