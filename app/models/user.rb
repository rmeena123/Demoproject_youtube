class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :playlists
  has_many :posts, through: :playlists
  has_many :subscriptions
  has_many :subscribtion_plans, through: :subscriptions


  after_create :usermailer
  def usermailer
    UserMailer.with(user: self).welcome_email.deliver_later
 end
end
