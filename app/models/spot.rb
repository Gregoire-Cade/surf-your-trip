class Spot < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :trips
  has_many_attached :photos
  extend Enumerize

  validates :name, :level, :location, :country, presence: true
  enumerize :level, in: %i[beginner novice improver expert]
  enumerize :beach_type, in: %w[sandy rocky glass]
end
