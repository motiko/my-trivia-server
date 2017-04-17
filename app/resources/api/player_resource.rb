class Api::PlayerResource < JSONAPI::Resource
  attributes :name, :email, :img_url

  def img_url
     "#{@model.avatar.img_url}"
  end

  has_one :avatar
end


# class Api::PlayerResource < JSONAPI::Resource
#   attributes :name, :email
#
#   def img_url
#     "#{@model.avatar.img_url}"
#   end
#
#   has_one :avatar
# end
