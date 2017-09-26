class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :all_tags, through: :tags
  has_many :comments
  has_many :bookmarks
  has_many :posts
  has_one :userinfo, inverse_of: :user

  accepts_nested_attributes_for :userinfo
end
