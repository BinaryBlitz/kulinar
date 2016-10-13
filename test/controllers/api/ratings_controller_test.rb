require 'test_helper'

class API::RatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rating = ratings(:rating)
    @recipe = recipes(:recipe)
  end

  test 'should create rating' do
    @rating.destroy

    assert_difference 'Rating.count' do
      post api_recipe_ratings_url(@recipe), params: {
        api_token: api_token,
        rating: @rating.attributes
      }
    end

    assert_response :created
  end

  test 'should update rating' do
    new_value = -1
    patch api_rating_url(@rating, api_token: api_token), params: {
      rating: { value: new_value }
    }

    assert_response :ok
    @rating.reload
    assert_equal new_value, @rating.value
  end

  test 'should destroy Rating' do
    assert_difference 'Rating.count', -1 do
      delete api_rating_url(@rating), params: { api_token: api_token }
    end

    assert_response :no_content
  end
end
