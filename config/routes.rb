Rails.application.routes.draw do



  get 'user/index'

  get 'user/dashboard'

  get 'service_center/index'

  get 'service_center/dashboard'

# devise routes
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions", registrations: "users/registrations" }
  devise_for :service_centers, path: 'service_centers', controllers: { sessions: "service_centers/sessions", registrations: "service_centers/registrations" }

#routes
  resources :appointments, only: [:create, :update, :destroy]
  resources :autos, only: [:new, :create]

  match '/requests/appointments/complete/:id' => 'requests#complete', as: 'complete_request', via: :put

# nested routes
  resources :requests do
    resources :quotes
    collection do
      get "sc_dashboard" # generate  get "/requests/sc_dashboard"
    end
  end
  # resources :services, only: [:index]

# custom routes
  get "new_service", to: 'requests#new_service', as: :new_service
  
  get '/requests/add_quote/:id', to: 'requests#add_quote', as: 'add_quote'

  get "welcome", to: "welcome#index", as: :welcome


# root
  root 'welcome#index'

end
