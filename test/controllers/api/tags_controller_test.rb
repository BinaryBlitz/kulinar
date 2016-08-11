require 'test_helper'

class API::TagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag = tags(:tag)
  end

  test 'should get index' do
    get api_tags_path(api_token: api_token)
    assert_response :success
  end

  test 'should get show' do
    get api_tag_path(@tag, api_token: api_token)
    assert_response :success
  end
end
