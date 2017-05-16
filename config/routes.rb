Rails.application.routes.draw do

  root 'requests#index'

  devise_for :users
  
  resources :requests do
    resources :quotes



  end
end
