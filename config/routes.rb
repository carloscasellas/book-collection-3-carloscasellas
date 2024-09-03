Rails.application.routes.draw do
  # get "books/new"
  # get "books/create"
  # get "books/index"
  # get "books/show"
  # get "books/edit"
  # get "books/update"
  # get "books/delete"
  # get "books/destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post "books/create", to: "books#create", as: "books_create"
  get "books/new", to: "books#new", as: "books_new"
  get "books/:id/edit", to: "books#edit", as: "books_edit"
  patch "books/:id/update", to: "books#update", as: "books_update"
  put "books/:id", to: "books#update"
  get "books/:id", to: "books#show", as: "books_show"
  get "books", to: "books#index", as: "books_index"
  get "books/:id/delete", to: "books#delete", as: "books_delete"
  delete "books/:id", to: "books#destroy", as: "books_destroy"

  resources :books do
    member do
      get :delete
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "books#index"
end
