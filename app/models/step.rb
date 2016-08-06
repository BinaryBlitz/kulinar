class Step < ApplicationRecord
  belongs_to :recipe

  validates :name, :description, presence: true
  validates :position, numericality: { greater_than: 0 }

  mount_uploader :image, ImageUploader
end
