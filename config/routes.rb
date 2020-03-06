Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :commerces
      resources :coupons
      resources :advertisements
      resources :categories
      resources :favorites
      resources :notifications
      resources :products
      resources :offers
      resources :purchaces
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
