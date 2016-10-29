require 'test_helper'

class API::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:foo)
  end

  test 'should get show' do
    get api_user_path(@user, api_token: api_token)
    assert_response :success
  end

  test 'should create user' do
    @user.destroy

    assert_difference 'User.count' do
      post api_user_url(@user, api_token: api_token), params: {
        user: @user.attributes.merge(password: 'qwerty123')
      }
    end

    assert_response :created
  end
end
