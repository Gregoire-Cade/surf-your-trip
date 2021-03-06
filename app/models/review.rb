class Review < ApplicationRecord
  belongs_to :user
  belongs_to :spot, touch: true
  has_one_attached :photo

  validates :title, :content, :rating, presence: true
  validates :content, length: { minimum: 20 }
end
