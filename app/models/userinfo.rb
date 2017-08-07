class Userinfo < ApplicationRecord
  belongs_to :user
  validate :user_name, presence: true
  validate :user_name, uniqueness: true
  validate :profile, presence: true
end
