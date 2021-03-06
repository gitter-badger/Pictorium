class Userinfo < ApplicationRecord
  belongs_to :user, inverse_of: :userinfo, optional: true
  validates :user_name, presence: true
  validates :user_name, uniqueness: true
  validates :profile, presence: true
end
