class Api::V1::ActivitiesController < ApplicationController
  before_action :select_activity, only: [:show, :edit, :update, :destroy]

  def index
    @activities = Activity.all
    render json: @activities, include: [:users]
  end

  def random
    @activities = Activity.all
    redirect_to get_random_activity
  end

  def select_activity
    @activity = Activity.find(params[:id])
    render json: @activity, include: [:users]
  end

  private
  def activities_params
    params.permit(:description)
  end

  def get_random_activity
    @activity = Activity.all.sample(1)
    render json: @activity, include: [:users]
  end

end
