class PokemonController < ApplicationController
  POKEMON_DATA = [
    { number: "#0001", name: "Bulbasaur", types: ["Grass", "Poison"] },
    { number: "#0002", name: "Ivysaur", types: ["Grass", "Poison"] },
    { number: "#0003", name: "Venusaur", types: ["Grass", "Poison"] },
    { number: "#0004", name: "Charmander", types: ["Fire"] },
    { number: "#0005", name: "Charmeleon", types: ["Fire"] },
    { number: "#0006", name: "Charizard", types: ["Fire", "Flying"] },
    { number: "#0007", name: "Squirtle", types: ["Water"] },
    { number: "#0008", name: "Wartortle", types: ["Water"] },
    { number: "#0009", name: "Blastoise", types: ["Water"] },
    { number: "#0010", name: "Caterpie", types: ["Bug"] },
    { number: "#0011", name: "Metapod", types: ["Bug"] },
    { number: "#0012", name: "Butterfree", types: ["Bug", "Flying"] },
    { number: "#0013", name: "Weedle", types: ["Bug", "Poison"] },
    { number: "#0014", name: "Kakuna", types: ["Bug", "Poison"] },
    { number: "#0015", name: "Beedrill", types: ["Bug", "Poison"] },
    { number: "#0016", name: "Pidgey", types: ["Normal", "Flying"] },
    { number: "#0017", name: "Pidgeotto", types: ["Normal", "Flying"] },
    { number: "#0018", name: "Pidgeot", types: ["Normal", "Flying"] },
    { number: "#0019", name: "Rattata", types: ["Normal"] },
    { number: "#0020", name: "Raticate", types: ["Normal"] },
    { number: "#0021", name: "Spearow", types: ["Normal", "Flying"] },
    { number: "#0022", name: "Fearow", types: ["Normal", "Flying"] },
    { number: "#0023", name: "Ekans", types: ["Poison"] },
    { number: "#0024", name: "Arbok", types: ["Poison"] },
    { number: "#0025", name: "Pikachu", types: ["Electric"] },
    { number: "#0026", name: "Raichu", types: ["Electric"] },
    { number: "#0027", name: "Sandshrew", types: ["Ground"] },
    { number: "#0028", name: "Sandslash", types: ["Ground"] },
    { number: "#0029", name: "Nidoran♀", types: ["Poison"] },
    { number: "#0030", name: "Nidorina", types: ["Poison"] },
    { number: "#0031", name: "Nidoqueen", types: ["Poison", "Ground"] },
    { number: "#0032", name: "Nidoran♂", types: ["Poison"] },
    { number: "#0033", name: "Nidorino", types: ["Poison"] },
    { number: "#0034", name: "Nidoking", types: ["Poison", "Ground"] },
  ]

  def index
    search = params[:search]&.strip&.downcase
    offset = params[:offset].to_i

    filtered_pokemon = POKEMON_DATA

    # Filter Pokémon based on search query
    if search.present?
      normalized_search = search.gsub(/^#*/, "").rjust(4, "0") # Normalize search query
      filtered_pokemon = POKEMON_DATA.select do |poke|
        poke[:name].downcase.include?(search) || # Match partial name
        poke[:number].gsub(/^#*/, "").include?(normalized_search) || # Match variations like 1, 01, 001
        poke[:number].include?(search) # Allow loose matches with '#' or similar
      end
    end

    # Paginate Pokémon with offset
    @pokemon = filtered_pokemon[offset, 10] || []

    # Respond to both HTML and JSON formats
    respond_to do |format|
      format.html # Render HTML for the initial page load
      format.json { render json: @pokemon } # Send JSON for JavaScript/AJAX requests
    end
  end
end

