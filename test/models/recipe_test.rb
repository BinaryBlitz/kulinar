require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  setup do
    @recipe = recipes(:recipe)
  end

  test 'valid' do
    assert @recipe.valid?
  end
end
