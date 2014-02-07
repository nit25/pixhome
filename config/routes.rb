Pictures::Application.routes.draw do

  root :to => "Picapp#welcome", as: 'welcome'
  get "/user/index"

  resources :photos
  resources :users

  get '/photos/:id/destroy' => 'Photos#destroy'
  get '/error' => 'Picapp#error'
  get '/error2' => 'Picapp#error2'
  post '/comments/new/:id' => 'Comments#new'
  get '/follows/present/:id' => 'Follows#present'
  get '/follows/show/:id' => 'Follows#show'
  get '/follows/new/:id' => 'Follows#create'
  get '/follows/destroy/:id' => 'Follows#destroy'
  post '/search' => 'Picapp#search', as: 'search'
  get '/welcome' =>'Picapp#welcome', as: 'welcome'
  get '/home' =>'Picapp#home', as: 'home'
  get '/sessions/destroy' =>'Sessions#destroy'
  get '/sessions/new' => 'Sessions#new', as: 'new_session'
  post '/sessions' => 'Sessions#create', as: 'sessions'
  delete '/sessions' => 'Sessions#destroy', as: 'session'

  match ':controller(/:action(/:id))', :via => :get

  match ':controller(/:action(/:id(.:format)))', :via => :get

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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
