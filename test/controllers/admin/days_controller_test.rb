require 'test_helper'

class Admin::DaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @day = days(:day)
    sign_in_admin
  end

  test 'should get index' do
    get admin_days_path
    assert_response :success
  end

  test 'should get show' do
    get admin_day_path(@day)
    assert_response :success
  end

  test 'should create day' do
    @day.destroy

    assert_difference 'Day.count' do
      post admin_days_url(@day), params: { day: @day.attributes }
    end
  end

  test 'should update day' do
    new_date = Time.new(2016, 8, 1)
    patch admin_day_path(@day), params: { day: { starts_at: new_date } }
    assert_redirected_to admin_days_path
    assert_equal new_date, @day.reload.starts_at
  end

  test 'should destroy day' do
    assert_difference 'Day.count', -1 do
      delete admin_day_url(@day)
    end

    assert_redirected_to admin_days_path
  end
end
