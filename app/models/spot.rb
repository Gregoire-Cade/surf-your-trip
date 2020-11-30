class Spot < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  after_touch :spot_waves
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :trips
  has_many_attached :photos
  extend Enumerize

  validates :name, :level, :location, :country, presence: true
  enumerize :level, in: %i[beginner novice improver expert]
  enumerize :beach_type, in: %w[sandy rocky glass]

  def city
    location.split(',').first
  end

  def spot_waves
    waves = 0
    number_of_rating = 0
    self.reviews.each do |review|
      waves += review.rating
      number_of_rating += 1
    end
    self.waves = number_of_rating == 0 ? 0 : waves / number_of_rating
    self.save
    return self.waves
  end
end
