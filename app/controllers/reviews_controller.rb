class ReviewsController < ApplicationController
  def new
  @review = Review.new
  @spot = Spot.find(params[:spot_id])
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @review = Review.new(review_params)
    @review.spot = @spot
    @review.user = current_user
    if @review.save
      redirect_to spot_path(@spot)
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :rating, :photo)
  end
end
