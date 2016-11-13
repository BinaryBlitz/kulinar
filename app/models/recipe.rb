# == Schema Information
#
# Table name: recipes
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  description    :text             not null
#  cooking_time   :integer          not null
#  image          :string           not null
#  calories       :float            not null
#  proteins       :float            not null
#  fats           :float            not null
#  carbohydrates  :float            not null
#  restaurant_id  :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  likes_count    :integer          default(0)
#  dislikes_count :integer          default(0)
#  category_id    :integer
#

class Recipe < ApplicationRecord
  belongs_to :restaurant, optional: true
  belongs_to :category

  has_many :steps, dependent: :destroy
  has_many :days, dependent: :destroy
  has_many :selections, through: :picks
  has_many :picks, dependent: :destroy, inverse_of: :recipe
  has_many :taggings, dependent: :destroy, inverse_of: :recipe
  has_many :tags, through: :taggings
  has_many :picks, dependent: :destroy
  has_many :ratings, dependent: :destroy

  validates :name, :description, :image, :cooking_time, presence: true
  validates :proteins, :fats, :carbohydrates, numericality: { greater_than_or_equal_to: 0 }
  validates :calories, numericality: { greater_than: 0 }

  accepts_nested_attributes_for :taggings, allow_destroy: true

  mount_uploader :image, ImageUploader
end
