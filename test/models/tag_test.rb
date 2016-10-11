# == Schema Information
#
# Table name: tags
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  tag_group_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class TagTest < ActiveSupport::TestCase
  setup do
    @tag = tags(:tag)
  end

  test 'valid' do
    assert @tag.valid?
  end
end
