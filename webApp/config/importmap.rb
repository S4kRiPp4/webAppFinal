# Pin npm packages by running ./bin/importmap

pin "application" # Ensures the main application entry is pinned
pin "@hotwired/turbo-rails", to: "turbo.min.js" # Ensure Turbo is pinned
pin "bootstrap" # @5.3.3
pin "pokemon", to: "pokemon.js" # Ensure pokemon.js is pinned
pin "@rails/ujs", to: "https://cdn.jsdelivr.net/npm/@rails/ujs@7.1.5/lib/assets/compiled/rails-ujs.js" # Use CDN for rails-ujs
pin "@popperjs/core", to: "@popperjs--core.js" # @2.11.8
