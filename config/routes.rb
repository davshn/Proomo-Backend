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
      resources :partners
      post  '/find_client' => 'users#find_client'
      post  '/find_user' => 'users#find_user'
      post  '/create_user' => 'users#create_user'
      put  '/:id/update_user' => 'users#update_user'
      get  '/find_product_categories' => 'categories#find_product_categories'
      get  '/find_service_categories' => 'categories#find_service_categories'
      get  '/find_product_category_points' => 'categories#find_product_category_points'
      get  '/find_service_category_points' => 'categories#find_service_category_points'
      post '/collet_hook' => 'purchaces#collet_hook'
      post '/validate_sale' => 'purchaces#validate_sale'
      get '/find_my_purchaces' => 'purchaces#find_my_purchaces'
      get '/find_coupons' => 'commerces#find_coupons'
      get '/find_purchace_by_ticket' => 'purchaces#find_purchace_by_ticket'
      get '/get_points/:id' => 'users#get_points'
      post '/save_favorites' => 'users#save_favorites'
      get '/user_favorites/:id' => 'users#user_favorites'
      get '/find_commerce_by_category/:id' => 'commerces#find_commerce_by_category'
      get  '/index_subcategories' => 'categories#index_subcategories'
      put  '/destroy_category/:id' => 'categories#destroy_category'
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
