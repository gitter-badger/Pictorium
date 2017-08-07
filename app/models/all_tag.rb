class AllTag < ApplicationRecord
  has_many :posts, through: tags
  has_many :tags, dependent: :destroy
end
