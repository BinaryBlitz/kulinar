require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  setup do
    @rating = ratings(:rating)
  end

  test 'valid' do
    assert @rating.valid?
  end

  test 'value 1 or -1' do
    values =[1, -1]
    values.each do |value|
      @rating.value = value
      assert @rating.valid?
    end

    @rating.value = 2
    assert @rating.invalid?
  end

  test 'uniqueness' do
    rating = @rating.dup
    assert rating.invalid?
  end
end
