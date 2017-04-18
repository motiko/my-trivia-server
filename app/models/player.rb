class Player < ApplicationRecord
  include ActiveModel::Validations

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, email: true

  belongs_to :avatar

  has_many :played_games
  has_many :games, through: :played_games
end
