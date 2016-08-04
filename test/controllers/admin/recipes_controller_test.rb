require 'test_helper'

class Admin::RecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe = recipes(:recipe)
  end

  test 'should get index' do
    get admin_recipes_path
    assert_response :success
  end

  test 'should get show' do
    get admin_recipe_path(@recipe)
    assert_response :success
  end

  test 'should create recipe' do
    @recipe.destroy

    assert_difference 'Recipe.count' do
      post admin_recipes_url(@recipe), params: {
        recipe: @recipe.attributes.merge(
          image: fixture_file_upload('public/blank.jpg')
        )
      }
    end
  end

  test 'should update recipe' do
    new_name = 'New name'
    patch admin_recipe_path(@recipe), params: { recipe: { name: new_name } }
    assert_redirected_to admin_recipes_path
    assert_equal new_name, @recipe.reload.name
  end

  test 'should destroy recipe' do
    assert_difference 'Recipe.count', -1 do
      delete admin_recipe_url(@recipe)
    end

    assert_redirected_to admin_recipes_path
  end
end
