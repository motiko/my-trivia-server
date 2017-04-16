class Api::PlayerResource < JSONAPI::Resource
  attributes :name, :email

  has_one :avatar
end
