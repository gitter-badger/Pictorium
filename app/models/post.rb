class Post < ApplicationRecord
  belongs_to :user
  has_many :all_tags, through: tag
  has_many :bookmarks
  has_many :comments

  mount_uploader :image, ImageUploader
end
