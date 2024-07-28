class Image < ApplicationRecord
  belongs_to :collection
  has_many_attached :photos
end
