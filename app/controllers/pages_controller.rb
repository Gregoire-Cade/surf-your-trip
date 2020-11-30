class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
     @spots = Spot.order(waves: :desc).order(:name).first(3)
  end
end
