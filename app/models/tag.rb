class Tag < ApplicationRecord
  belongs_to :tag_group, inverse_of: :tags

  has_many :taggings, dependent: :destroy
  has_many :recipes, through: :taggings

  validates :name, presence: true
end
