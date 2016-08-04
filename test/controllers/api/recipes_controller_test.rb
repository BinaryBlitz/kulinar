require 'test_helper'

class API::RecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe = recipes(:recipe)
  end

  test 'should get index' do
    get api_recipes_path
    assert_response :success
  end

  test 'should get show' do
    get api_recipe_path(@recipe)
    assert_response :success
  end
end
