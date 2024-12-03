class UserPokemon < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon

  # Validations
  validates :user_id, uniqueness: { scope: :pokemon_id, message: "has already added this Pokémon to their collection" }
  validates :user, presence: true
  validates :pokemon, presence: true
end
