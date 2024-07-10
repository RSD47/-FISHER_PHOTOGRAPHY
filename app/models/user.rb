class User < ApplicationRecord
  validates :name, presence: true
  validates :username, presence: true
  validates :password, presence: true

  has_many :photos
  has_many :collections
  has_many :photos, through: :collections
end
