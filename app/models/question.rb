class Question < ApplicationRecord
  serialize :answers, JSON

  validates :text, presence: true
  validates :answers, presence: true
end
