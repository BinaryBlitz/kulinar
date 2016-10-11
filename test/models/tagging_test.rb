# == Schema Information
#
# Table name: taggings
#
#  id         :integer          not null, primary key
#  recipe_id  :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TaggingTest < ActiveSupport::TestCase
  setup do
    @tagging = taggings(:tagging)
  end

  test 'valid' do
    assert @tagging.valid?
  end
end
