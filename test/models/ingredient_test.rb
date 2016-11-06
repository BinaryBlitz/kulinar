# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  setup do
    @ingredient = ingredients(:ingredient)
  end

  test 'valid' do
    assert @ingredient.valid?
  end
end
