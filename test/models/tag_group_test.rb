require 'test_helper'

class TagGroupTest < ActiveSupport::TestCase
  setup do
    @tag_group = tag_groups(:tag_group)
  end

  test 'valid' do
    assert @tag_group.valid?
  end
end
