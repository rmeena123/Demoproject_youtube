class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :likes
  has_many :comments
  has_many :playlists
  has_many :posts, through: :playlists
  has_many :subscriptions
  has_many :subscribtion_plans, through: :subscriptions
end
