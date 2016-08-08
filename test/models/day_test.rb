require 'test_helper'

class DayTest < ActiveSupport::TestCase
  setup do
    @day = days(:day)
  end

  test 'valid' do
    assert @day.valid?
  end
end
