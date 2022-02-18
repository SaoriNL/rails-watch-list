class List < ApplicationRecord
  has_many :bookmarks
  has_one_attached :photo
  # A list has many movies through bookmarks
  has_many :movies, through: :bookmarks, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
