Rails.application.routes.draw do

  resources :course_categories
  resources :users, only: [:new, :create]
  

  #root 'signin#index'
  root 'landing#home'

  #The blog spot

  mount Lines::Engine => "/blog"
  
  #the landing spot
  
  get 'home', to: 'landing#home'
  get 'about_us', to: 'landing#about_us'
  get 'contact', to: 'landing#contact'
  get 'courses', to: 'landing#courses'

  #
  get '/course/:id', to: 'courses#show_course'

  #lms

  get 'lms', to: 'signin#index'

  get '/courses/:id/image', to: 'courses#show_image'
  get '/snippets/:id/image', to: 'snippets#show_image'
  get '/users/:id/image', to: 'users#show_image'
  get '/outcome_files/:id/upload', to: 'outcome_files#show_upload'
  match ':controller(/:action(/:id(.:format)))', via: %i[get post put patch]

  

  mount PdfjsViewer::Rails::Engine => '/pdfjs', as: 'pdfjs'

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
