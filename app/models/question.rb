class Question < ApplicationRecord
  serialize :answers, JSON

  validates :text, presence: true
  validates :answer, presence: true
end
