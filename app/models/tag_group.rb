# == Schema Information
#
# Table name: tag_groups
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TagGroup < ApplicationRecord
  has_many :tags, dependent: :destroy, inverse_of: :tag_group
  accepts_nested_attributes_for :tags, allow_destroy: true

  validates :name, presence: true
end
