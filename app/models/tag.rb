class Tag < ApplicationRecord
  has_many :posts, through: :posts_tags
en
