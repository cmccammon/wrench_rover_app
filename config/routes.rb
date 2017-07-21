Rails.application.routes.draw do



  resources :request_services
  resources :autos


  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" }
  devise_for :service_centers, path: 'service_centers', controllers: { sessions: "service_centers/sessions" }

  resources :requests do
    resources :quotes
  end

  resources :service_categories do
    resources :services
  end

  get '/requests/add_quote/:id', to: 'requests#add_quote', as: 'add_quote'

  root 'autos#new'

end
