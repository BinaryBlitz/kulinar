# == Schema Information
#
# Table name: restaurants
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  description  :text             not null
#  image        :string           not null
#  icon         :string           not null
#  address      :string           not null
#  phone_number :string           not null
#  site_url     :string           not null
#  featured     :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

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
