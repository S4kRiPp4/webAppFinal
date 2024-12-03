# db/seeds.rb

# Define the Pokémon data
POKEMON_DATA = [
  { number: "#0001", name: "Bulbasaur", types: "Grass,Poison" },
  { number: "#0002", name: "Ivysaur", types: "Grass,Poison" },
  { number: "#0003", name: "Venusaur", types: "Grass,Poison" },
  { number: "#0004", name: "Charmander", types: "Fire" },
  { number: "#0005", name: "Charmeleon", types: "Fire" },
  { number: "#0006", name: "Charizard", types: "Fire,Flying" },
  { number: "#0007", name: "Squirtle", types: "Water" },
  { number: "#0008", name: "Wartortle", types: "Water" },
  { number: "#0009", name: "Blastoise", types: "Water" },
  { number: "#0010", name: "Caterpie", types: "Bug" },
  { number: "#0011", name: "Metapod", types: "Bug" },
  { number: "#0012", name: "Butterfree", types: "Bug,Flying" },
  { number: "#0013", name: "Weedle", types: "Bug,Poison" },
  { number: "#0014", name: "Kakuna", types: "Bug,Poison" },
  { number: "#0015", name: "Beedrill", types: "Bug,Poison" },
  { number: "#0016", name: "Pidgey", types: "Normal,Flying" },
  { number: "#0017", name: "Pidgeotto", types: "Normal,Flying" },
  { number: "#0018", name: "Pidgeot", types: "Normal,Flying" },
  { number: "#0019", name: "Rattata", types: "Normal" },
  { number: "#0020", name: "Raticate", types: "Normal" },
  { number: "#0021", name: "Spearow", types: "Normal,Flying" },
  { number: "#0022", name: "Fearow", types: "Normal,Flying" },
  { number: "#0023", name: "Ekans", types: "Poison" },
  { number: "#0024", name: "Arbok", types: "Poison" },
  { number: "#0025", name: "Pikachu", types: "Electric" },
  { number: "#0026", name: "Raichu", types: "Electric" },
  { number: "#0027", name: "Sandshrew", types: "Ground" },
  { number: "#0028", name: "Sandslash", types: "Ground" },
  { number: "#0029", name: "Nidoran♀", types: "Poison" },
  { number: "#0030", name: "Nidorina", types: "Poison" },
  { number: "#0031", name: "Nidoqueen", types: "Poison,Ground" },
  { number: "#0032", name: "Nidoran♂", types: "Poison" },
  { number: "#0033", name: "Nidorino", types: "Poison" },
  { number: "#0034", name: "Nidoking", types: "Poison,Ground" },
]

POKEMON_DATA.each do |poke|
  pokemon = Pokemon.find_or_initialize_by(name: poke[:name]) # Match on name to avoid duplicates
  pokemon.update!(
    pokedex_number: poke[:number], # Store the # intact
    types: poke[:types]
  )
end

puts "Seeded Pokémon data globally!"

