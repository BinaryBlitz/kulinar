class Api::RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.favourited
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end
end
