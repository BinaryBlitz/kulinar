class API::RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.featured
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end
end
