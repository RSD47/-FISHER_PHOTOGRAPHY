class Collection < ApplicationRecord
  validates :match, presence: true
  validates :season, presence: true

  has_many_attached :photos
  belongs_to :user
  # belongs_to :photo
end
