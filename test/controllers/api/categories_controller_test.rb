require 'test_helper'

class API::CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:category)
  end

  test 'should get index' do
    get api_categories_path
    assert_response :success
  end

  test 'should get show' do
    get api_category_path(@category)
    assert_response :success
  end
end
