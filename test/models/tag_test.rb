require 'test_helper'

class TagTest < ActiveSupport::TestCase
  setup do
    @tag = tags(:tag)
  end

  test 'valid' do
    assert @tag.valid?
  end
end
