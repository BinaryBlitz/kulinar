require 'test_helper'

class SelectionTest < ActiveSupport::TestCase
  setup do
    @selection = selections(:selection)
  end

  test 'valid' do
    assert @selection.valid?
  end
end
