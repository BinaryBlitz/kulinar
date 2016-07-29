class Restaurant < ApplicationRecord
  validates :name, :description, :image, :icon,
            :address, :phone_number, :site, presence: true
  validate :number_of_favourited

  scope :favourited, -> { where(favourited: true) }

  mount_uploader :image, ImageUploader
  mount_uploader :icon, IconUploader

  private

  def number_of_favourited
    errors.add(:base, 'Нельзя добавить больше 5 избранных') if favourited? && favourited.count >= 5
  end
end
