class Photo < ApplicationRecord
  belongs_to :collection, dependent: :destroy
  has_many_attached :photos
  belongs_to :user
end
