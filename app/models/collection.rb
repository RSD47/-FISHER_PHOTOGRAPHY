class Collection < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  belongs_to :photo
end
