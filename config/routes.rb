Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "lists#index"

  #listas
    # lista todas listas
    # formulario para criar listas
    # create salvar lista
    # show mostra uma lista especiifca
    # dentro da rota aidicona na lista quero coloca os favoritos
    # create salavar na lista os favoristo
  resources :lists, only:  [:index, :show, :new, :create, :destroy] do
    resources :bookmarks, only:[:new, :create]
  end

  #remover filme do favorito
  resources :bookmarks, only: [:destroy]

  #listar todos os filmes
  #listar apenas um
  resources :movies, only: [:index, :show]
end
