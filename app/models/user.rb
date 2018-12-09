class User < ApplicationRecord
  has_secure_password
  has_many :user_activities
  has_many :activities, through: :user_activities
  has_many :user_restaurants
  has_many :restaurants, through: :user_restaurants
  has_many :friends
  validates :name, presence: true
  validates :username, uniqueness: { case_sensitive: false }
  validates :username, presence: true
  validates :password, presence: true
  validates :password, confirmation: true
end
