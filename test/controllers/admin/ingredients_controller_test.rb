require 'test_helper'

class Admin::IngredientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ingredient = ingredients(:ingredient)
    sign_in_admin
  end

  test 'should get index' do
    get admin_ingredients_path
    assert_response :success
  end

  test 'should get show' do
    get admin_ingredient_path(@ingredient)
    assert_response :success
  end

  test 'should create ingredient' do
    @ingredient.destroy

    assert_difference 'Ingredient.count' do
      post admin_ingredients_url(@ingredient), params: { ingredient: @ingredient.attributes }
    end
  end

  test 'should update ingredient' do
    new_name = 'New name'
    patch admin_ingredient_path(@ingredient), params: { ingredient: { name: new_name } }
    assert_redirected_to admin_ingredients_path
    assert_equal new_name, @ingredient.reload.name
  end

  test 'should destroy ingredient' do
    assert_difference 'Ingredient.count', -1 do
      delete admin_ingredient_url(@ingredient)
    end

    assert_redirected_to admin_ingredients_path
  end
end
