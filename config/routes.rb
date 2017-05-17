Rails.application.routes.draw do

  root 'requests#index'

  devise_for :users

  resources :requests do
    resources :quotes
  end

  get '/requests/add_quote/:id', to: 'requests#add_quote', as: 'add_quote'


end
