Rails.application.routes.draw do
  get 'static/help'

  get 'static/settings'

  # resources :posts

  resources :forums do
    resources :posts
  end

  # resources :events

  resources :calendars do
    resources :events
  end

  resources :groups

  resources :children

  resources :users
  resource :sessions, only: [:new, :create, :destroy]
  match '/settings', to: "static#settings", via: "get"
  match '/help', to: "static#help", via: "get"
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  get "/application/sign_out" => "application#sign_out"

  get "/users/add_child_to_user/:user_id" => "users#add_child_to_user"
  get "/users/remove_child_from_user/:user_id/:child_id" => "users#remove_child_from_user"
  get "/groups/add_user_request_to_group/:group_id" => "groups#add_user_request_to_group"
  get "/groups/remove_request_from_group/:group_id" => "groups#remove_request_from_group"
  get "/groups/accept_request/:group_id" => "groups#accept_request"
  root "sessions#new"

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
