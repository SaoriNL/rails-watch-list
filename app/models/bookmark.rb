class Bookmark < ApplicationRecord
  # You can’t delete a movie if it is referenced in at least one bookmark.
  belongs_to :movie
  # When you delete a list, you should delete all associated bookmarks (but not the movies as they can be referenced in other lists).
  belongs_to :list
  # validate :movie, presence: true
  # validates :list, presence: true

  # the [movie, list] pairings should be unique.
  # validates :name, presence: true, uniqueness: { scope: :account_id }

  validates :comment, length: { minimum: 6 }
  validates :movie, uniqueness: { scope: [:list] }
  validates_associated :list, :movie
end
