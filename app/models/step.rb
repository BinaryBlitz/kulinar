# == Schema Information
#
# Table name: steps
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text             not null
#  position    :integer          not null
#  timer       :integer
#  image       :string
#  recipe_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Step < ApplicationRecord
  belongs_to :recipe

  validates :name, :description, presence: true
  validates :position, numericality: { greater_than: 0 }

  mount_uploader :image, ImageUploader
end
