Rails.application.routes.draw do
 
  get 'sessions/new'

  get 'users/new'

  get 'record/index'

  get 'record/show'

  get 'genre/index'

  get 'genre/show'

  get '/index', to: 'welcome#index', as: 'welcome'

  get 'record/index', to: 'record#index', as: 'records'

  post 'record/index'
  post 'record/:id', to: 'record#show'
  post 'record/:id/add', to: 'record#add', as: 'add_record'

  post '/index', to: 'welcome#index'

  get "/log_in", to: "sessions#new", :as => "log_in"
  post "/log_in", to: "sessions#create"

  get "/log_out", to: "sessions#destroy", :as => "log_out"

  get "/sign_up", to: "users#new", :as => "sign_up"

  post '/users', to: 'users#create'
  post 'users/:id', to: 'users#show'
  post 'users/:id/edit', to: 'users#edit'
  delete '/users/:id', to: "users#destroy", :as => 'destroy_user'

  post '/baskets/:id', to: 'baskets#show', as: 'show_basket'



  resources :record, :sessions, :users, :baskets

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
