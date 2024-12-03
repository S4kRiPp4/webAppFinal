require 'rails_helper'

RSpec.describe "pokemons/edit", type: :view do
  let(:pokemon) {
    Pokemon.create!(
      name: "MyString",
      pokedex_number: 1,
      nickname: "MyString",
      user: nil
    )
  }

  before(:each) do
    assign(:pokemon, pokemon)
  end

  it "renders the edit pokemon form" do
    render

    assert_select "form[action=?][method=?]", pokemon_path(pokemon), "post" do

      assert_select "input[name=?]", "pokemon[name]"

      assert_select "input[name=?]", "pokemon[pokedex_number]"

      assert_select "input[name=?]", "pokemon[nickname]"

      assert_select "input[name=?]", "pokemon[user_id]"
    end
  end
end
