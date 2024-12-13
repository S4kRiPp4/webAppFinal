class Pokemon < ApplicationRecord
  # Associations
  has_many :user_pokemons, dependent: :destroy
  has_many :users, through: :user_pokemons

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :pokedex_number, presence: true, uniqueness: true
  validates :types, presence: true
end

