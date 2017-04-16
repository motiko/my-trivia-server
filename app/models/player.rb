class Player < ApplicationRecord
  include ActiveModel::Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, email: true
  has_one :avatar
end
