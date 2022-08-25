Rails.application.routes.draw do  
  get 'home/index'
  devise_for :users
  resources :courses  
  get "privacy_policy", to: 'static_pages#privacy_policy'
  
  #Ensure you have defined root_url to *something* in your config/routes.rb."
  root "static_pages#landing_page"
end
