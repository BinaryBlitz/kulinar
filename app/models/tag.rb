# == Schema Information
#
# Table name: tags
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  tag_group_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Tag < ApplicationRecord
  belongs_to :tag_group, inverse_of: :tags

  has_many :taggings, dependent: :destroy
  has_many :recipes, through: :taggings

  validates :name, presence: true
end
