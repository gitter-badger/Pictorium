class AllTag < ApplicationRecord
  has_many :posts, through: :tags
end
