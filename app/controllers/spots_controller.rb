class SpotsController < ApplicationController
  def index
    @spots = Spot.all

    @markers = @spots.geocoded.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { spot: spot }),
        image_url: helpers.asset_url('marker.png')
      }
    end
  end

  def show
    @spot = Spot.find(params[:id])
    @marker =
      [{
        lat: @spot.latitude,
        lng: @spot.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { spot: @spot }),
        image_url: helpers.asset_url('marker.png')
      }]
  end
end
