class Review < ApplicationRecord
  belongs_to :list

  validates :content, length: { maximum: 140 }, presence: true
  validates :rating, inclusion: { in: (1..5).to_a, message: 'should be a number between 1 and 5' }, presence: true
end
