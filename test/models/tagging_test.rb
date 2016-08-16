require 'test_helper'

class TaggingTest < ActiveSupport::TestCase
  setup do
    @tagging = taggings(:tagging)
  end

  test 'valid' do
    assert @tagging.valid?
  end
end
