class AllowNullForUserIdInPokemons < ActiveRecord::Migration[7.0]
  def change
    change_column_null :pokemons, :user_id, true
  end
end

