# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  api_token  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string           not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:foo)
  end

  test 'valid' do
    assert @user.valid?
  end

  test 'invalid without name' do
    @user.name = nil
    assert @user.invalid?
  end
end
