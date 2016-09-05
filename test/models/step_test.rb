# == Schema Information
#
# Table name: steps
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text             not null
#  position    :integer          not null
#  timer       :integer
#  image       :string
#  recipe_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class StepTest < ActiveSupport::TestCase
  setup do
    @step = steps(:step)
  end

  test 'valid' do
    assert @step.valid?
  end
end
