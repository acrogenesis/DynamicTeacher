Rails.application.routes.draw do
  root 'pages#index'
  get 'generate_signed_s3_url' => 'aws#generate_signed_s3_url'

  devise_for :users, controllers: { registrations: 'registrations',
                                    sessions: 'sessions',
                                    passwords: 'passwords'}

  get 'dashboard' => 'dashboard#index', as: :dashboard

  resources :homeworks, only: :show
  resources :diagnostic_exam, only: :show
  resources :diagnostic_exam_users, only: :create
  resources :practices, only: :show

  # get 'tarea/:id' => 'homeworks#show', as: :new_homework_user
  post 'subir-tarea' => 'homeworks_users#create', as: :homework_users

  namespace :admin do
    get 'dashboard' => 'dashboard#index'
    resources :homeworks, except: :index
    resources :homeworks_users, only: [:show, :update, :destroy]
    resources :groups, except: :index
    resources :videos, except: :index
    resources :diagnostic_exams do
      resources :questions
    end
    resources :practices do
      resources :questions
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
