require 'test_helper'

class API::RestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant = restaurants(:restaurant)
  end

  test 'should get index' do
    get api_restaurants_path(api_token: api_token)
    assert_response :success
  end

  test 'should get show' do
    get api_restaurant_path(@restaurant, api_token: api_token)
    assert_response :success
  end
end
