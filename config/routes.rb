Rails.application.routes.draw do


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
  resources :services, only: [:index]

# custom routes
  get '/requests/add_quote/:id', to: 'requests#add_quote', as: 'add_quote'

# root
  root 'autos#new'

end
