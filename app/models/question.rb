class Question < ApplicationRecord
  serialize :answers, JSON
end
