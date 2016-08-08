require 'test_helper'

class Admin::SelectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @selection = selections(:selection)
    sign_in_admin
  end

  test 'should get index' do
    get admin_selections_path
    assert_response :success
  end

  test 'should get show' do
    get admin_selection_path(@selection)
    assert_response :success
  end

  test 'should create selection' do
    @selection.destroy

    assert_difference 'Selection.count' do
      post admin_selections_url(@selection), params: {
        selection: @selection.attributes.merge(
          image: fixture_file_upload('public/blank.jpg')
        )
      }
    end
  end

  test 'should update selection' do
    new_name = 'New name'
    patch admin_selection_path(@selection), params: { selection: { name: new_name } }
    assert_redirected_to admin_selections_path
    assert_equal new_name, @selection.reload.name
  end

  test 'should destroy selection' do
    assert_difference 'Selection.count', -1 do
      delete admin_selection_url(@selection)
    end

    assert_redirected_to admin_selections_path
  end
end
