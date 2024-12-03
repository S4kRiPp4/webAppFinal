class ChangePokedexNumberToString < ActiveRecord::Migration[7.0]
  def change
    change_column :pokemons, :pokedex_number, :string
  end
end

