class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def profile
    render json: { user: current_user }, status: :accepted
  end

  def index
    if @user.valid?
      @users = User.all
      render json: @users, include: [:friends]
    end
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: @user, jwt: @token }, include: [:restaurants, :activities, :friends], status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  private

  def user_params
    params.permit(:name, :username, :password, :password_confirmation)
  end

end
