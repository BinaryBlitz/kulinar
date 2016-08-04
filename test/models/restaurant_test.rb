require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  setup do
    @restaurant = restaurants(:restaurant)
  end

  test 'valid' do
    assert @restaurant.valid?
  end
end
