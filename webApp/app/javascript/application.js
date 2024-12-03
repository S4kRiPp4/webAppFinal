// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "pokemon";

// Import Rails UJS to handle method: :delete, etc.
import Rails from "@rails/ujs";
Rails.start();

