# == Schema Information
#
# Table name: picks
#
#  id           :integer          not null, primary key
#  recipe_id    :integer
#  selection_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class PickTest < ActiveSupport::TestCase
  setup do
    @pick = picks(:pick)
  end

  test 'valid' do
    assert @pick.valid?
  end
end
