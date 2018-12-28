class Api::V1::FriendshipsController < ApplicationController

  def index
    @friendships = Friendship.all
    render json: @friendships
  end

  def create
    @friendship = Friendship.create(user_id: params[:user_id], friend_id: params[:friend_id])
    render json: { friendship: @friendship }, status: :accepted
  end

  private

  def friendship_params
    params.permit(:user_id, :friend_id)
  end

end
