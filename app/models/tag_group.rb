class TagGroup < ApplicationRecord
  has_many :tags, dependent: :destroy, inverse_of: :tag_group
  accepts_nested_attributes_for :tags, allow_destroy: true

  validates :name, presence: true
end
