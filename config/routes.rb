require 'sidekiq/web'
Rails.application.routes.draw do
  get 'mobile/index'

  get 'mobile/dashboard'

  get 'setting/user'

  get 'setting/extra'

  get 'setting/application'

  post 'setting/update'

  use_doorkeeper

  get '/users' => 'home#redirect'
  
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users

  root 'home#index' 

  namespace :api do
    namespace :v1 do
      resources :omniauth
      get 'angular/users' => 'angular#users'
      get 'angular/user/:pku_id' => 'angular#user'
      get 'angular/user' => 'angular#user'
      get 'angular/current_info' => 'angular#current_info'
      post 'tweet' => 'tweet#create', as: 'create_tweet'
      delete 'tweet/:tweet_id' => 'tweet#delete', as: 'delete_tweet'
      get 'tweet/:user' => 'tweet#show', as: 'show_tweet'
    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
