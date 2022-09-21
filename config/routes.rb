Rails.application.routes.draw do  
  devise_for :users
  resources :courses
  resources :users, only: [:index]

  get 'home/index'
  get 'home/activity'
  get "privacy_policy", to: 'static_pages#privacy_policy'    
  root "static_pages#landing_page"
end
