require 'rails_helper'

RSpec.describe "pokemons/index", type: :view do
  before(:each) do
    assign(:pokemons, [
      Pokemon.create!(
        name: "Bulbasaur",
        pokedex_number: 1,
        nickname: "My Bulba",
        user: User.create!(email: "test@example.com", password: "password"),
        types: "Grass,Poison"
      ),
      Pokemon.create!(
        name: "Charmander",
        pokedex_number: 4,
        nickname: "Char",
        user: User.create!(email: "another@example.com", password: "password"),
        types: "Fire"
      )
    ])
  end

  it "renders a list of pokemons with their details" do
    render
    assert_select 'div.card', count: 2 # Ensure two Pokémon cards are displayed
    assert_select 'h5.card-title', text: "Bulbasaur", count: 1
    assert_select 'h5.card-title', text: "Charmander", count: 1
    assert_select 'p.card-text', text: "Type: Grass,Poison", count: 1
    assert_select 'p.card-text', text: "Type: Fire", count: 1
    assert_select 'p.card-text', text: "Pokedex Number: 1", count: 1
    assert_select 'p.card-text', text: "Pokedex Number: 4", count: 1
    assert_select 'p.card-text', text: "Nickname: My Bulba", count: 1
    assert_select 'p.card-text', text: "Nickname: Char", count: 1
  end
end

