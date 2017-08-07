class AllTag < ApplicationRecord
  has_many :posts, through: tag
end
