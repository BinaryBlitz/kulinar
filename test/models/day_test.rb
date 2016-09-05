# == Schema Information
#
# Table name: days
#
#  id         :integer          not null, primary key
#  starts_at  :datetime         not null
#  recipe_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class DayTest < ActiveSupport::TestCase
  setup do
    @day = days(:day)
  end

  test 'valid' do
    assert @day.valid?
  end
end
