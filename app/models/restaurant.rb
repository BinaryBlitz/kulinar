class Restaurant < ApplicationRecord
  MAX_FEATURED = 5

  has_many :recipes, dependent: :destroy

  validates :name, :description, :image, :icon,
            :address, :phone_number, :site, presence: true
  validate :featured_count

  scope :featured, -> { where(featured: true) }

  mount_uploader :image, ImageUploader
  mount_uploader :icon, IconUploader

  def self.max_featured?
    featured.count >= MAX_FEATURED
  end

  private

  def featured_count
    return unless featured?
    errors.add(:base, 'Нельзя добавить больше 5 избранных') if Restaurant.max_featured?
  end
end
