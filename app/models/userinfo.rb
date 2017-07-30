class Userinfo < ApplicationRecord
  belongs_to :user
  validate :handle_name, presence: true
  validate :handle_name, uniqueness: true
  validate :biography, presence: true
end
