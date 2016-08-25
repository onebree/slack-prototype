Rails.application.routes.draw do
  root "home#index"

  get "/mockup", :to => "home#mockup"

  resources :channels, only: [:show]
  resources :messages, only: [:create]
  resources :conversations, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
