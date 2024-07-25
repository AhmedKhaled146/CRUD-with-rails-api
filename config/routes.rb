Rails.application.routes.draw do

  get "todos/index" # working well
  get "todos/create" # render teh form
  post "todos/create" # working well
  get "todos/edit" # render form
  put 'todos/edit/:id', to: 'todos#update' # working well
  delete "todos/delete/:id", to: 'todos#destroy' # working well
  get "todos/show/:id", to: 'todos#show' # working well

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  resources :todos
  root "todos#index"
end
