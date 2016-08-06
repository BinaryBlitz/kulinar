require 'test_helper'

class API::StepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @step = steps(:step)
    @recipe = @step.recipe
  end

  test 'should get index' do
    get api_recipe_steps_path(@recipe, api_token: api_token)
    assert_response :success
  end

  test 'should get show' do
    get api_recipe_step_path(@recipe, @step, api_token: api_token)
    assert_response :success
  end
end
