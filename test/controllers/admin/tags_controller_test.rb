require 'test_helper'

class Admin::TagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag = tags(:tag)
    sign_in_admin
  end

  test 'should get index' do
    get admin_tags_path
    assert_response :success
  end

  test 'should get show' do
    get admin_tag_path(@tag)
    assert_response :success
  end

  test 'should create tag' do
    @tag.destroy

    assert_difference 'Tag.count' do
      post admin_tags_url(@tag), params: { tag: @tag.attributes }
    end
  end

  test 'should update tag' do
    new_name = 'New name'
    patch admin_tag_path(@tag), params: { tag: { name: new_name } }
    assert_redirected_to admin_tags_path
    assert_equal new_name, @tag.reload.name
  end

  test 'should destroy tag' do
    assert_difference 'Tag.count', -1 do
      delete admin_tag_url(@tag)
    end

    assert_redirected_to admin_tags_path
  end
end
