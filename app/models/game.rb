class Game < ApplicationRecord

  STATUSES = ["in_progress","finished","aborted"].map{ |e| [e.to_sym,e]}.to_h

  enum status: STATUSES

  validates :rules, presence: true
  # validates :status, inclusion: {in: STATUSES.values},
  #             message: "%{value} is not a valid game status"

  belongs_to :rules

  has_many :played_games
  has_many :game_questions

  has_many :players, through: :played_games
  has_many :questions, through: :game_questions


  def next_unanswered
    game_questions.unanswered.first
  end

  before_create -> { status = "in_progress"}

end
