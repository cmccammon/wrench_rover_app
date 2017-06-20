Rails.application.routes.draw do


  resources :request_services
  resources :autos
  root 'requests#index'

  devise_for :users

  resources :requests do
    resources :quotes
  end

  resources :service_categories do
    resources :services
  end


  get '/requests/add_quote/:id', to: 'requests#add_quote', as: 'add_quote'


end
