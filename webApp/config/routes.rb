Rails.application.routes.draw do
  devise_for :users
  
  # Health check route for monitoring
  get "up" => "rails/health#show", as: :rails_health_check
  
  # Routes for Pokémon
  get "explore_pokemon", to: "pokemon#index", as: :explore_pokemon
  
  # Resourceful route for Pokémon index
  resources :pokemon, only: [:index]

  # Set root to the home#index action
  root "home#index"
end


