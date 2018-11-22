class User < ApplicationRecord
  has_secure_password
  has_many :user_activities
  has_many :activities, through: :user_activities
  has_many :user_restaurants
  has_many :restaurants, through: :user_restaurants
  has_many :friends
end
