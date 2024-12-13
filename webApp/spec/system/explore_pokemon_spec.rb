require 'rails_helper'

RSpec.describe "Explore Pokémon", type: :system do
  # Happy Path: Guest sees a list of Pokémon
  context "guest visits the Explore Pokémon page" do
    it "displays a list of Pokémon" do
      # Seed the database with Pokémon
      create(:pokemon, name: "Bulbasaur", types: "Grass, Poison")
      create(:pokemon, name: "Charmander", types: "Fire")

      # Visit the Pokémon index page
      visit pokemons_path

      # Verify Pokémon are displayed
      expect(page).to have_content("Bulbasaur")
      expect(page).to have_content("Charmander")
    end
  end

  # Sad Path: Guest visits but no Pokémon exist
  context "guest visits the Explore Pokémon page with no Pokémon" do
    it "shows a message that no Pokémon are available" do
      # Ensure no Pokémon exist
      Pokemon.delete_all

      # Visit the Pokémon index page
      visit pokemons_path

      # Verify the no Pokémon message
      expect(page).to have_content("No Pokémon available")
    end
  end
end
