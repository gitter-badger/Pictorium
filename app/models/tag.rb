class Tag < ApplicationRecord
  belongs_to :post
  belongs_to :all_tag
end