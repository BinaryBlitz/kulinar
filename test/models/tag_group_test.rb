# == Schema Information
#
# Table name: tag_groups
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TagGroupTest < ActiveSupport::TestCase
  setup do
    @tag_group = tag_groups(:tag_group)
  end

  test 'valid' do
    assert @tag_group.valid?
  end
end
