class API::StepsController < API::APIController
  before_action :set_recipe, only: [:index]

  def index
    @steps = @recipe.steps.all
  end

  def show
    @step = Step.find(params[:id])
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
