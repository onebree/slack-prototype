Rails.application.routes.draw do
  root "home#index"

  get "/mockup", :to => "home#mockup"

  resources :chat_rooms, only: [:show]
  resources :conversations, only: [:show, :create]
  resources :messages, :only => [:create]

  get    "login"  => "sessions#new",     :as => :login
  post   "login"  => "sessions#create"
  delete "logout" => "sessions#destroy", :as => :logout

  get  "/search" => "home#search", :as => :search

  mount ActionCable.server => "/cable"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
