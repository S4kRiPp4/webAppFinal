json.extract! pokemon, :id, :name, :pokedex_number, :nickname, :user_id, :created_at, :updated_at
json.url pokemon_url(pokemon, format: :json)
