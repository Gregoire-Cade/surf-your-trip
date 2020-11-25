class ReviewsController < ApplicationController
  def create
    @spot = Spot.find(params[:spot_id])
    @review = Review.new(review_params)
    @review.spot = @spot
    if @review.save
      redirect_to spot_path(@spot)
    else
      render 'spots/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :content)
  end
end
