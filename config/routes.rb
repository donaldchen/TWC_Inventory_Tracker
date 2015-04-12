Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'login#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  get 'login' => 'login#login'
  post 'login' => 'login#verify'
  get 'logout' => 'login#logout'
  get 'work_order_home' => 'work_order#index'
  post 'work_order_home' => 'work_order#check'
  post 'new_work_order' => 'work_order#new'

  get 'confirmation/:id', to: 'work_order#confirmation', as: 'confirmation'
  get '/item_list/:id', to: 'work_order#item_list', as: 'item_list'

  post '/item_list/:id/', to: 'work_order#update', as: 'item_list_update'
  delete '/item_list/:id/:pid', to: 'work_order#destroy', as: 'item_list_delete'
  
  get '/item_list_add/:id/', to: 'work_order#add_to_work_order', as: 'add_item'
  post '/item_list_add/:id/', to: 'work_order#add_item_confirm'

  get 'store_item' => 'store_item#index'
  post 'store_item' => 'store_item#store'

  get 'update_quantity' => 'update_quantity#index'
  post 'update_quantity' => 'update_quantity#update'
  match 'update_item/:id' => 'update_quantity#update_item', via: :get, as: :update_item




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
