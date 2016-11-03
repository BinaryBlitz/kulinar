# == Schema Information
#
# Table name: selections
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text             not null
#  image       :string           not null
#  starts_at   :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  featured    :boolean          default(FALSE)
#

require 'test_helper'

class SelectionTest < ActiveSupport::TestCase
  setup do
    @selection = selections(:selection)
  end

  test 'valid' do
    assert @selection.valid?
  end
end
