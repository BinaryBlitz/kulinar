require 'test_helper'

class Admin::RestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant = restaurants(:restaurant)
  end

  test 'should get index' do
    get admin_restaurants_path
    assert_response :success
  end

  test 'should get show' do
    get admin_restaurant_path(@restaurant)
    assert_response :success
  end

  test 'should create restaurant' do
    @restaurant.destroy

    assert_difference 'Restaurant.count' do
      post admin_restaurants_url(@restaurant), params: {
        restaurant: @restaurant.attributes.merge(
          image: fixture_file_upload('public/blank.jpg'),
          icon: fixture_file_upload('public/blank.jpg')
        )
      }
    end
  end

  test 'should update restaurant' do
    new_name = 'New name'
    patch admin_restaurant_path(@restaurant), params: { restaurant: { name: new_name } }
    assert_redirected_to admin_restaurants_path
    assert_equal new_name, @restaurant.reload.name
  end

  test 'should destroy restaurant' do
    assert_difference 'Restaurant.count', -1 do
      delete admin_restaurant_url(@restaurant)
    end

    assert_redirected_to admin_restaurants_path
  end
end
