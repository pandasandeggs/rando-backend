class Api::V1::UserActivitiesController < ApplicationController

  def index
    @user_activities = UserActivity.all
    render json: @user_activities
  end

end
