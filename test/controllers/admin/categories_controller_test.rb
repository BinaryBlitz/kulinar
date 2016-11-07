require 'test_helper'

class Admin::CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:category)
    sign_in_admin
  end

  test 'should get index' do
    get admin_categories_path
    assert_response :success
  end

  test 'should get show' do
    get admin_category_path(@category)
    assert_response :success
  end

  test 'should create category' do
    @category.destroy

    assert_difference 'Category.count' do
      post admin_categories_url(@category), params: {
        category: @category.attributes.merge(
          image: fixture_file_upload('public/blank.jpg')
        )
      }
    end
  end

  test 'should update category' do
    new_name = 'New name'
    patch admin_category_path(@category), params: { category: { name: new_name } }
    assert_redirected_to admin_categories_path
    assert_equal new_name, @category.reload.name
  end

  test 'should destroy category' do
    assert_difference 'Category.count', -1 do
      delete admin_category_url(@category)
    end

    assert_redirected_to admin_categories_path
  end
end
