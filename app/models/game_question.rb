class GameQuestion < ApplicationRecord
  include ActiveModel::Validations

  validates :selected_answer,
            numericality: {greater_than_or_equal_to: 0, less_than: 4},
            allow_nil: true


  belongs_to :game
  belongs_to :question

  scope :unanswered, -> { where(selected_answer: nil) }
end
