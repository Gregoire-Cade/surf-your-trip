class Review < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  # has_many_attached :photos

  validates :title, :content, :rating, presence: true
  validates :content, length: { minimum: 20 }
end
