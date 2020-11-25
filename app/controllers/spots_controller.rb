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
    @review = Review.new
    @marker =
      [{
        lat: @spot.latitude,
        lng: @spot.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { spot: @spot }),
        image_url: helpers.asset_url('marker.png')
      }]
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user = current_user
    if @spot.save
      redirect_to spot_path(@spot.id)
    else
      flash[:alert] = "You must sign in"
      render :new
    end
  end

  private
  def spot_params
    params.require(:spot).permit(:name, :location, :country, :level, :beach_type, :description, :about_location, :punchline, photos: [])
  end


end
