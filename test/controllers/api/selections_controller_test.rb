require 'test_helper'

class API::SelectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @selection = selections(:selection)
  end

  test 'should get index' do
    get api_selections_path(api_token: api_token)
    assert_response :success
  end

  test 'should get show' do
    get api_selection_path(@selection, api_token: api_token)
    assert_response :success
  end
end
