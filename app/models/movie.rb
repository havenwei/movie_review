class Movie < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :title, presence: true

  has_many :movie_relationships
  has_many :members, through: :movie_relationships, source: :user

  mount_uploader :image, ImageUploader

  scope :latest, -> {order("updated_at DESC")}
end
