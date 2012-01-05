Dp::Application.routes.draw do
 match 'comments/new' => 'comments#new' 
 resources :comments

  get "home/index"

  devise_for :admins
  devise_scope :admin do
    get "admins/sign_out", :to => "devise/sessions#destroy"
  end
  
  devise_for :users
  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
    get "sign_up", :to => "devise/registrations#new"
    get "users/sign_out", :to => "devise/sessions#destroy"
  end
  
  root :to => "home#index"
  
  
  match 'cast_drama/new/:drama_id/:cast_id' =>  'cast_drama#new'
  get "cast_drama/show"

  get "cast_drama/new"

  get "cast_drama/edit"

  get "cast_drama/detroy"

  match 'casts' => 'cast#index'
  match 'casts/:id' => 'cast#show'


  get "cast/index"

  get "cast/edit"

  get "cast/detroy"

  get "cast/new"

  get "cast/show"
  match 'dramas/addcast/:drama_id/:cast_name/:cast_id' =>  'dramas#addcast'  
  match 'dramas/addcast/:drama_id/:cast_name' =>  'dramas#addcast'
  match 'dramas/addcast/:drama_id' =>  'dramas#addcast'
  match 'dramas/addcast' =>  'dramas#addcast'
  match 'dramas/like/' => 'dramas#like'
  get "dramas/like"
  resources :dramas do
    member do
      get :picture
    end
  end


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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
