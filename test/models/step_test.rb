require 'test_helper'

class StepTest < ActiveSupport::TestCase
  setup do
    @step = steps(:step)
  end

  test 'valid' do
    assert @step.valid?
  end
end
