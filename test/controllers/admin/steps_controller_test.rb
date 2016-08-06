require 'test_helper'

class Admin::StepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @step = steps(:step)
    @recipe = @step.recipe
  end

  test 'should get index' do
    get admin_recipe_steps_path(@recipe)
    assert_response :success
  end

  test 'should create step' do
    assert_difference 'Step.count' do
      post admin_recipe_steps_url(@recipe), params: {
        step: @step.attributes.merge(
          image: fixture_file_upload('public/blank.jpg')
        )
      }
    end

    assert_redirected_to admin_recipe_steps_path(@recipe)
  end

  test 'should update step' do
    new_name = 'New name'
    patch admin_step_path(@step), params: { step: { name: new_name } }
    assert_redirected_to admin_recipe_steps_path(@recipe)
    assert_equal new_name, @step.reload.name
  end

  test 'should destroy step' do
    assert_difference 'Step.count', -1 do
      delete admin_step_url(@step)
    end

    assert_redirected_to admin_recipe_steps_path(@recipe)
  end
end
