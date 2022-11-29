class Post < ApplicationRecord

  belongs_to :admin_user
  belongs_to :category
  has_one_attached :video
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :playlists, dependent: :destroy
  has_many :users, through: :playlists

  enum post_type: [:audio, :video ]


  validates :image, :name, :description, :duration, :post_type, presence: true

  scope :post_enable, -> { where(disable: false) }
  
end
