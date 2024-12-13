FactoryBot.define do
  # User factory
  factory(:user) do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
  end

  # Pokemon factory
  factory(:pokemon) do
    name { Faker::Games::Pokemon.name } # Generates a random Pokémon name
    pokedex_number { Faker::Number.number(digits: 4).to_s } # Generates a random Pokedex number
    types { "Grass, Poison" } # Default types
  end
end

