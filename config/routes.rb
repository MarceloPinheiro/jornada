Rails.application.routes.draw do
  resources :veiculo_rastreadores
  resources :veiculo_motoristas
  get 'page/index'

  #paginas interativa

  get 'viagens/viagem' => 'viagens#viagem'
  get 'viagens/cria_viagem' => 'viagens#cria_viagem'

  post 'viagens/impcsv' => 'viagens#impcsv'
  get 'viagens/impcsv' => 'viagens#impcsv'

  post 'page/jornada' => 'page#jornada'

  get 'motoristas/autocomplete' => 'motoristas#autocomplete'

  get '/jornadaex' => 'page#jornadaex'

  #fim das paginas

  resources :viagens
  resources :parada_empresas
  resources :ponto_paradas
  resources :tipo_paradas
  resources :eventos
  resources :tipo_eventos
  resources :veiculos
  resources :rastreadores
  resources :motoristas
  resources :empresas
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'page#index'

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
