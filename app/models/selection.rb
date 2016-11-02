# == Schema Information
#
# Table name: selections
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text             not null
#  image       :string           not null
#  starts_at   :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  featured    :boolean          default(FALSE)
#

class Selection < ApplicationRecord
  MAX_SELECTIONS = 3

  has_many :picks, dependent: :destroy, inverse_of: :selection
  has_many :recipes, through: :picks
  accepts_nested_attributes_for :picks, allow_destroy: true

  validates :name, :description, :image, :starts_at, presence: true

  scope :latest, -> { order(:starts_at).limit(MAX_SELECTIONS) }

  mount_uploader :image, ImageUploader
end
