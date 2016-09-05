# == Schema Information
#
# Table name: picks
#
#  id           :integer          not null, primary key
#  recipe_id    :integer
#  selection_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Pick < ApplicationRecord
  belongs_to :recipe
  belongs_to :selection, inverse_of: :picks
end
