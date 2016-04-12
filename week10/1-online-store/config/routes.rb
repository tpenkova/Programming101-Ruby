Rails.application.routes.draw do
# Routes for Brands
  get '/brands/', to: 'brands#index'

  get '/brands/count', to: 'brands#count'
  get '/brands/:id', to: 'brands#show'

  get '/brands/range/:id', to: 'brands#range'
  get '/brands/range/:id/:count', to: 'brands#from'

  post '/brands/new', to: 'brands#create'
  put '/brands/:id', to: 'brands#update'

  delete '/brands/:id', to: 'brands#destroy'
#----------------------------------------------------------
# Routes for Categories
  get '/categories/', to: 'categories#index'

  get '/categories/count', to: 'categories#count'
  get '/categories/:id', to: 'categories#show'

  get '/categories/range/:id', to: 'categories#range'
  get '/categories/range/:id/:count', to: 'categories#from'

  post '/categories/new', to: 'categories#create'
  put '/categories/:id', to: 'categories#update'

  delete '/categories/:id', to: 'categories#destroy'

#------------------------------------------------------------
# Routes for Products
  get '/products/', to: 'products#index'

  get '/products/count', to: 'products#count'
  get '/products/:id', to: 'products#show'

  get '/products/range/:id', to: 'products#range'
  get '/products/range/:id/:count', to: 'products#from'

  post '/products/new', to: 'products#create'
  put '/products/:id', to: 'products#update'

  delete '/products/:id', to: 'products#destroy'

#------------------------------------------------------------
#Routes for Searches0
  get '/search/:type/:slug', to: 'searches#search_by_type_and_slug'
  get '/search/:type/:property/:slug', to: 'searches#search_by_type_and_property_and_slug'
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
