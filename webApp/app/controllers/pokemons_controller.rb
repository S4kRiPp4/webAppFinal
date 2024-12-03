class PokemonsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_pokemon, only: %i[edit update destroy]

  # GET /pokemons or /explore_pokemon
  def index
    offset = params[:offset].to_i
    limit = 10

    if user_signed_in?
      # Fetch the user's personal collection if logged in
      @pokemons = fetch_user_pokemons(offset, limit)
    else
      # Allow guests to explore all Pokémon
      @pokemons = fetch_global_pokemons(offset, limit)
    end

    respond_to do |format|
      format.html # Full page for non-AJAX requests
      format.js   # AJAX requests for "Load More"
      format.json { render json: @pokemons }
    end
  end

  # POST /pokemons
  def create
    @pokemon = Pokemon.find(params[:pokemon_id])
    user_pokemon = current_user.user_pokemons.build(pokemon: @pokemon)

    if user_pokemon.save
      redirect_to pokemons_path, notice: "Pokémon added to your collection."
    else
      redirect_to pokemons_path, alert: user_pokemon.errors.full_messages.to_sentence
    end
  end

  # PATCH/PUT /pokemons/:id
  def update
    if @pokemon.user_pokemons.exists?(user: current_user)
      if @pokemon.update(pokemon_params)
        redirect_to pokemons_path, notice: "Pokémon nickname updated."
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to pokemons_path, alert: "You can only edit Pokémon in your collection."
    end
  end

  # DELETE /pokemons/:id
  def destroy
    user_pokemon = current_user.user_pokemons.find_by(pokemon: @pokemon)
    if user_pokemon
      user_pokemon.destroy
      redirect_to pokemons_path, notice: "Pokémon removed from your collection."
    else
      redirect_to pokemons_path, alert: "You can only remove Pokémon in your collection."
    end
  end

  private

  # Fetch the authenticated user's Pokémon collection
  def fetch_user_pokemons(offset, limit)
    if params[:search].present?
      search_query = normalize_search_query(params[:search])
      if search_query[:type] == :pokedex
        current_user.pokemons.where("pokedex_number LIKE ?", search_query[:query])
      else
        current_user.pokemons.where("lower(name) LIKE ?", "%#{search_query[:query]}%")
      end
    else
      current_user.pokemons
    end.order(:pokedex_number).limit(limit).offset(offset)
  end

  # Fetch all available Pokémon for guests
  def fetch_global_pokemons(offset, limit)
    if params[:search].present?
      search_query = normalize_search_query(params[:search])
      if search_query[:type] == :pokedex
        Pokemon.where("pokedex_number LIKE ?", search_query[:query])
      else
        Pokemon.where("lower(name) LIKE ?", "%#{search_query[:query]}%")
      end
    else
      Pokemon
    end.order(:pokedex_number).limit(limit).offset(offset)
  end

  # Normalize the search query to handle Pokédex numbers and names
  def normalize_search_query(query)
    query = query.strip.downcase
    if query.match?(/^#?\d+$/) # Matches patterns like #01, 01, 1
      normalized_query = query.delete("#").to_i.to_s.rjust(4, "0")
      { type: :pokedex, query: "##{normalized_query}" }
    else
      { type: :name, query: query }
    end
  end

  # Find the specific Pokémon for editing/deleting
  def set_pokemon
    @pokemon = current_user.pokemons.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to pokemons_path, alert: "Pokémon not found."
  end

  def pokemon_params
    params.require(:pokemon).permit(:nickname)
  end
end
