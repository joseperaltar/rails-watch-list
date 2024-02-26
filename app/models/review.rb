class Review < ApplicationRecord
  belongs_to :list

  validates :content, :rating, presence: true
end
