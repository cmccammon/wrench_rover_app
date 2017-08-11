Rails.application.routes.draw do

  resources :appointments
# devise routes
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions", registrations: "users/registrations" }
  devise_for :service_centers, path: 'service_centers', controllers: { sessions: "service_centers/sessions", registrations: "service_centers/registrations" }

  resources :request_services
  resources :autos
# nested routes
  resources :requests do
    resources :quotes do
      resources :appointments
    end
    collection do
      get "sc_dashboard" # generate  get "/requests/sc_dashboard"
    end
  end

  resources :service_categories do
    resources :services
  end
# custom routes
  get '/requests/add_quote/:id', to: 'requests#add_quote', as: 'add_quote'
# root
  root 'autos#new'

end
