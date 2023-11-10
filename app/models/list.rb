class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  # A list must have a unique name.
  validates :name, presence: true, uniqueness: true
  # validates :image_url, presence: true

  has_one_attached :image
  # has_one_attached :description_image
end
