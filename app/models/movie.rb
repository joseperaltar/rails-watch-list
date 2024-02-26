class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :destroy

  validates :title, uniqueness: { case_sensitive: true }, presence: true
  validates :overview, presence: true
end
