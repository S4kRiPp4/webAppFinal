class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :pokedex_number
      t.string :nickname
      t.references :user, null: false, foreign_key: true
      t.string :types # Add this to store Pokémon types as a comma-separated string

      t.timestamps
    end
  end
end

