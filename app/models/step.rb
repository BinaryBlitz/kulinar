# == Schema Information
#
# Table name: steps
#
#  id                        :integer          not null, primary key
#  name                      :string           not null
#  description               :text             not null
#  position                  :integer          not null
#  timer                     :integer
#  image                     :string
#  recipe_id                 :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  use_image_as_recipe_cover :boolean          default(FALSE)
#

class Step < ApplicationRecord
  belongs_to :recipe

  validates :name, :description, presence: true
  validates :position, numericality: { greater_than: 0 }
  validate :image_as_recipe_cover_uniqueness

  scope :with_image_as_recipe_cover, -> { where(use_image_as_recipe_cover: true) }

  mount_uploader :image, ImageUploader

  private

  def image_as_recipe_cover_uniqueness
    return unless use_image_as_recipe_cover?
    if Step.where.not(id: id).with_image_as_recipe_cover.any?
      errors.add(:base, 'Нельзя добавить больше 1 главной фотографии')
    end
  end
end
