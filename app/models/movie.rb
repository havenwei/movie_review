class Movie < ApplicationRecord
  belongs_to :user
  has_many :reviews depedent: :destroy
  validates :title, presence: true
end
