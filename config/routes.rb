Rails.application.routes.draw do  
  devise_for :users
  resources :courses
  resources :users, only: [:index, :edit, :show, :update]

  get 'home/activity'
  get "privacy_policy", to: 'static_pages#privacy_policy'
  root 'home#index'
end
