# == Schema Information
#
# Table name: recipes
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  description   :text             not null
#  cooking_time  :integer          not null
#  image         :string           not null
#  calories      :float            not null
#  proteins      :float            not null
#  fats          :float            not null
#  carbohydrates :float            not null
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  setup do
    @recipe = recipes(:recipe)
  end

  test 'valid' do
    assert @recipe.valid?
  end
end
