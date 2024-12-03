require 'rails_helper'

RSpec.describe "pokemons/new", type: :view do
  before(:each) do
    assign(:pokemon, Pokemon.new(
      name: "MyString",
      pokedex_number: 1,
      nickname: "MyString",
      user: nil
    ))
  end

  it "renders new pokemon form" do
    render

    assert_select "form[action=?][method=?]", pokemons_path, "post" do

      assert_select "input[name=?]", "pokemon[name]"

      assert_select "input[name=?]", "pokemon[pokedex_number]"

      assert_select "input[name=?]", "pokemon[nickname]"

      assert_select "input[name=?]", "pokemon[user_id]"
    end
  end
end
