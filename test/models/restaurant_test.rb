# == Schema Information
#
# Table name: restaurants
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  description  :text             not null
#  image        :string           not null
#  icon         :string           not null
#  address      :string           not null
#  phone_number :string           not null
#  site_url     :string           not null
#  featured     :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  setup do
    @restaurant = restaurants(:restaurant)
  end

  test 'valid' do
    assert @restaurant.valid?
  end
end
