class Image < ApplicationRecord
  # belongs_to :collection, dependent: :destroy
  has_one_attached :photo
  belongs_to :collection
end
