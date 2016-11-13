# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  image      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  has_many :recipes, dependent: :destroy

  validates :name, length: { maximum: 20 }
  validates :image, presence: true

  mount_uploader :image, ImageUploader
end

