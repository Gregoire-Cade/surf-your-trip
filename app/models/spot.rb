class Spot < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  belongs_to :user
  has_many :reviews
  has_many :trips
  has_many_attached :photos
  extend Enumerize

  validates :name, :level, :location, presence: true
  enumerize :level, in: %i[beginner novice improver expert]
  enumerize :beach_type, in: %i[sandy rocky glass]
end
