class Api::V1::RestaurantsController < ApplicationController
  before_action :select_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
    render json: @restaurants, include: [:users]
  end

  # def random
  #   @restaurants = Restaurant.all
  #   redirect_to get_random_restaurant
  # end

  def select_restaurant
    @restaurant = Restaurant.find(params[:id])
    render json: @restaurant, include: [:users]
  end

  def random
    @restaurants = Restaurant.all
    @restaurant = @restaurants.sample(1)
    render json: @restaurant, include: [:users]
  end

  private
  def restaurant_params
    params.permit(:name,:url)
  end
end
