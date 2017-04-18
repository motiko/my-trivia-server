class Game < ApplicationRecord
  validates :rules, presence: true

  belongs_to :rules

  has_many :played_games
  has_many :game_questions

  has_many :players, through: :played_games
  has_many :questions, through: :game_questions

  def next_unanswered
    game_question = game_questions.unanswered.first
  end
end
