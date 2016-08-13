require 'test_helper'

class Admin::TagGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag_group = tag_groups(:tag_group)
    sign_in_admin
  end

  test 'should get index' do
    get admin_tag_groups_path
    assert_response :success
  end

  test 'should get show' do
    get admin_tag_group_path(@tag_group)
    assert_response :success
  end

  test 'should create tag_group' do
    @tag_group.destroy

    assert_difference 'TagGroup.count' do
      post admin_tag_groups_url(@tag_group), params: { tag_group: @tag_group.attributes }
    end
  end

  test 'should update tag_group' do
    new_name = 'New name'
    patch admin_tag_group_path(@tag_group), params: { tag_group: { name: new_name } }
    assert_redirected_to admin_tag_groups_path
    assert_equal new_name, @tag_group.reload.name
  end

  test 'should destroy tag_group' do
    assert_difference 'TagGroup.count', -1 do
      delete admin_tag_group_url(@tag_group)
    end

    assert_redirected_to admin_tag_groups_path
  end
end
