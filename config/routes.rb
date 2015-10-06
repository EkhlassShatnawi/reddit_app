Rails.application.routes.draw do
  resources :widgets
 namespace :admin do
  resources :categories, only: [:new, :create, :show, :index, :edit, :update ,:destroy]
end

  devise_for :admins
  devise_for :users 
  
  resources :votes 
  root 'categories#index'
  resources :posts do
    resources :votes 
  end

  resources :comments do
    resources :votes 
  end
  resources :categories do 
    resources :posts do 
      resources :comments 
    end
  end

  get 'post/show'
  #get ':show', to: 'categories#index' , as: :show_u
  #match 'subcategory/:id' => 'subcategories#index', via: [:get, :post]
 
  #match 'post/:id' => 'posts#create', via: [:get, :post]
#get '/categories/subcategories/:id', to: 'subcategries#show'
  #get 'categories/index'
  #get 'categories/create'
  #get 'categories/new'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   

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
