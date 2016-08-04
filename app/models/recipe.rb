class Recipe < ApplicationRecord
  belongs_to :restaurant, optional: true

  validates :name, :description, :image, :cooking_time, presence: true
  validates :proteins, :fats, :carbohydrates, numericality: { greater_than_or_equal_to: 0 }
  validates :calories, numericality: { greater_than: 0 }

  mount_uploader :image, ImageUploader
end
