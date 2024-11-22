# Pin npm packages by running ./bin/importmap

pin "application" # Ensures the main application entry is pinned
pin "@hotwired/turbo-rails", to: "turbo.min.js" # Ensure Turbo is pinned
pin "bootstrap", to: "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" # Bootstrap via CDN
pin "pokemon", to: "pokemon.js" # Ensure pokemon.js is pinned

