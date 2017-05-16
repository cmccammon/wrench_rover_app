Rails.application.routes.draw do

  devise_for :users
  resources :requests do
    resources :quotes

  root to: "requests#index"


  end
end
