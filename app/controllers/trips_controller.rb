class TripsController < ApplicationController
    def index
      @upcoming_trips = current_user.trips.where("start_date >= ?", Time.current.to_date)
      @previous_trips = current_user.trips.where("end_date <= ?", Time.current.to_date)
    end

    def show
      @trip = Trip.find(params[:id])
    end


    def create
      @trip = Trip.new(trip_params)
      @trip.user = current_user
      @trip.spot = Spot.find(params[:spot_id])
        if @trip.save
          redirect_to trips_path
        else
          flash[:alert] = "You entered incorrect infos, please try again 🏄 "
          redirect_to spot_path(@trip.spot)
        end
    end

    def destroy
      @trip = Trip.find(params[:id])
      @trip.destroy
      redirect_to trips_path
    end

    private

    def trip_params
      params.require(:trip).permit(:surfers, :start_date, :end_date)
    end
end
