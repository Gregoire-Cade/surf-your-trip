class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  validates :surfers, :start_date, :end_date, presence: true
end
