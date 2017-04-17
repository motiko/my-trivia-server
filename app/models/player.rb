class Player < ApplicationRecord
  include ActiveModel::Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, email: true
  belongs_to :avatar
end
