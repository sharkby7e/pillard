Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "pets#index"
  resources :pets, only: [ :index ], param: :id do
    resources :dosings, only: [ :index, :create ]
  end

  get "/:id", to: "pets#show", as: "pet"

  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
