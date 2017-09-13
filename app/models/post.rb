class Post < ApplicationRecord
  belongs_to :user
  has_many :all_tags, through: :tags
  has_many :tags, dependent: :destroy
  has_many :bookmarks
  has_many :comments

  mount_uploader :image, ImageUploader

  # タグの更新処理
  def save_tags tags
    current_tags = self.all_tags.pluch(:tag_name) unless self.all_tags.nil?

    old_tags = current_tags.collect!{|e| e unless tags.include? }.compact!
    new_tags = tags.collect!{|e| e unless current_tags.include? }.compact!

    old_tags.each do |old|
      self.all_tags.delete AllTag.find_by tag_name: old
    end
    
    new_tags.each do |new_name|
      image_tags = AllTag.find_or_create_by tag_name: new_name
      self.all_tags << image_tags
    end
  end
end
