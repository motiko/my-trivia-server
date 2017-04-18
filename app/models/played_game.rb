class PlayedGame < ApplicationRecord
  belongs_to :game
  belongs_to :player
  validates_associated :game, :player
end
