class Post < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :comments
  has_many :tags, through: :post_tags

  mount_uploader :image, ImageUploader

  # タグの更新処理
  def save_tags tags
    current_tags = self.tags.pluck(:name) unless self.tags.nil?

    old_tags = current_tags.collect!{|e| e unless tags.include? }.compact!
    new_tags = tags.collect!{|e| e unless current_tags.include? }.compact!

    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end
    
    new_tags.each do |new_name|
      image_tags = Tag.find_or_create_by(name: new_name)
      self.tags << image_tags
    end
  end
end
