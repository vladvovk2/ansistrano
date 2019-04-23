require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  root 'asds#home'

  resources :asds do
    get :home, on: :collection
  end
end
