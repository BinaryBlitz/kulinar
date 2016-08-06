class Category < ApplicationRecord
  has_many :recipes, dependent: :destroy

  validates :name, :image, presence: true

  mount_uploader :image, ImageUploader
end
