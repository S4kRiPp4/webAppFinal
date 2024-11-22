Rails.application.routes.draw do
  devise_for :users
  
  # Health check route for monitoring
  get "up" => "rails/health#show", as: :rails_health_check
  
  # Set root to the home#index action
  root "home#index"
end

