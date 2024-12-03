class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_pokemons, dependent: :destroy
  has_many :pokemons, through: :user_pokemons
end
