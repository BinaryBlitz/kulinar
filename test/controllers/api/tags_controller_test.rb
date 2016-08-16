require 'test_helper'

class API::TagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag = tags(:tag)
    @tag_group = @tag.tag_group
  end

  test 'should get index' do
    get api_tag_group_tags_path(@tag_group, api_token: api_token)
    assert_response :success
  end
end
