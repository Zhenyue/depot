Depot::Application.routes.draw do
  resources :root_categories


  get 'admin' => 'admin#index'
  get "store/index"
  get "store/question"
  get "store/news"
  get "store/contact"
  get "store/category"
  get "store/category_show"
  get "index_old" => 'store#index_old'
  
  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  scope '(:locale)' do
    resources :users

    resources :orders

    resources :line_items
    resources :liked_users
    
    resources :root_categories
    
    get 'liked_users/cancer_like/:product_id' => 'liked_users#cancer_like'
    
    resources :carts
    
    get 'line_item/minus/:id' => 'line_items#minus'
    get 'line_item/add/:id' => 'line_items#add'

    get 'search' => 'search#results'

    resources :products do
      get :who_bought, on: :member
      resources :comments
    end
    
    root to: 'store#index', as: 'store'

  end
  # ...
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
  # ...

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end