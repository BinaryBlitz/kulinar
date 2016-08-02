require 'test_helper'

class API::RestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant = restaurants(:restaurant)
  end

  test 'should get show' do
    get api_restaurant_path(@restaurant)
    assert_response :success
  end
end
