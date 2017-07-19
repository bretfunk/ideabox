class Idea < ApplicationRecord
  validates :idea, presence: true
  belongs_to :user
  belongs_to :category
  has_many :idea_images
  has_many :images, through: :idea_images
end
