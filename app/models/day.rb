# == Schema Information
#
# Table name: days
#
#  id         :integer          not null, primary key
#  starts_at  :datetime         not null
#  recipe_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Day < ApplicationRecord
  belongs_to :recipe

  validates :starts_at, presence: true
end
