require 'test_helper'

class API::TagGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag_group = tag_groups(:tag_group)
  end

  test 'should get index' do
    get api_tag_groups_path(api_token: api_token)
    assert_response :success
  end
end
