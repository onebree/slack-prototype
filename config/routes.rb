Rails.application.routes.draw do
  root "messages#index"
  
  resources :rooms, :only => [:show] do
    resources :messages, :only => [:index, :create]
  end

  get "/mockup" => "messages#mockup"

  get    "login"  => "sessions#new",     :as => :login
  post   "login"  => "sessions#create"
  delete "logout" => "sessions#destroy", :as => :logout

  mount ActionCable.server, :at => "/cable"
end
