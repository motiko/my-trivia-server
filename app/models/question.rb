class Question < ApplicationRecord
  serialize :answers, JSON

  validates :text, presence: true
  validates :answers, presence: true

  has_many :game_questions
  has_many :games, through: :game_questions

  def answers_text
    JSON.parse(answers).pluck("text")
  end
end
