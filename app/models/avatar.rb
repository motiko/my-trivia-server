class Avatar < ApplicationRecord
   validates :img_url, :format => URI::regexp(%w(http https))
end
