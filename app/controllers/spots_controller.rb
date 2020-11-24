class SpotsController < ApplicationController
  def index
    @spots = Spot.all

    @markers = @spots.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def show
    @spot = Spot.find(params[:id])
  end
end
