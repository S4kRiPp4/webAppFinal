require 'rails_helper'

RSpec.describe "pokemons/show", type: :view do
  before(:each) do
    assign(:pokemon, Pokemon.create!(
      name: "Name",
      pokedex_number: 2,
      nickname: "Nickname",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Nickname/)
    expect(rendered).to match(//)
  end
end
