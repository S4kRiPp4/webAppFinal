require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  # Test validations
  describe 'validations' do

    # Test 1: Validate that a Pokémon is valid with valid attributes
    it 'is valid with valid attributes' do
      # Creates a Pokémon object with all required attributes
      pokemon = build(:pokemon)
      expect(pokemon).to be_valid
    end

    # Test 2: Validate that a Pokémon is invalid without a name
    it 'is invalid without a name' do
      # Creates a Pokémon object without a name
      pokemon = build(:pokemon, name: nil)
      expect(pokemon).not_to be_valid
    end

    # Test 3: Validate that a Pokémon name is unique
    it 'is invalid with a duplicate name' do
      # Create a Pokémon with the name 'Pikachu'
      create(:pokemon, name: 'Pikachu')
      # Attempt to create another Pokémon with the same name
      duplicate_pokemon = build(:pokemon, name: 'Pikachu')
      expect(duplicate_pokemon).not_to be_valid
    end

    # Test 4: Validate that a Pokémon is invalid without types
    it 'is invalid without types' do
      # Creates a Pokémon object without types
      pokemon = build(:pokemon, types: nil)
      expect(pokemon).not_to be_valid
    end
  end

  # Test associations
  describe 'associations' do

    # Test 5: Ensure a Pokémon has many user_pokemons
    it { should have_many(:user_pokemons) }

    # Test 6: Ensure a Pokémon has many users through user_pokemons
    it { should have_many(:users).through(:user_pokemons) }
  end
end
