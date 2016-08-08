require 'test_helper'

class PickTest < ActiveSupport::TestCase
  setup do
    @pick = picks(:pick)
  end

  test 'valid' do
    assert @pick.valid?
  end
end
