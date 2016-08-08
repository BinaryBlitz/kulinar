require 'test_helper'

class API::DaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @day = days(:day)
  end

  test 'should get index' do
    get api_days_path(api_token: api_token)
    assert_response :success
  end

  test 'should get show' do
    get api_day_path(@day, api_token: api_token)
    assert_response :success
  end
end
