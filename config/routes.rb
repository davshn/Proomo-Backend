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
      resources :users
      post  '/find_client' => 'users#find_client'
      post  '/find_user' => 'users#find_user'
      post  '/create_user' => 'users#create_user'
      put  '/:id/update_user' => 'users#update_user'
      get  '/find_product_categories' => 'categories#find_product_categories'
      get  '/find_service_categories' => 'categories#find_service_categories'
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
