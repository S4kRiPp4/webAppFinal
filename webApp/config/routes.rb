Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users

  # Health check route for monitoring
  get "up" => "rails/health#show", as: :rails_health_check

  # Explore Pokémon route for guest browsing
  get "explore_pokemon", to: "pokemons#index", as: :explore_pokemon

  # Resourceful routes for Pokémon (for authenticated users to manage their collection)
  resources :pokemons

  # Set root to the home#index action
  root "home#index"
end
