class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:username]
  has_many :all_tags, through: :tags
  has_many :comments
  has_many :bookmarks
  has_many :posts
  has_one :userinfo, inverse_of: :user
  validates :username, uniqueness: true, presence: true

  accepts_nested_attributes_for :userinfo

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if conditions.delete(:login)
      where(conditions).where(["username = :value"], { value: username}).first
    else
      where(conditions).first
    end
  end
end
