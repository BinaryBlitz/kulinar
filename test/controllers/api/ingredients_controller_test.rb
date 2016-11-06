require 'test_helper'

class API::IngredientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ingredient = ingredients(:ingredient)
  end

  test 'should get index' do
    get api_ingredients_path(api_token: api_token)
    assert_response :success
  end
end
