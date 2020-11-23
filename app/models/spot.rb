class Spot < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :trips
  has_many_attached :photos
  extend Enumerize

  validates :name, :level, :location, presence: true
  enumerize :level, in: %i[beginner novice improver expert]
end
