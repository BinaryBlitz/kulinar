class API::RecipesController < API::APIController
  before_action :set_recipe, only: [:show]
  before_action :set_category, only: [:index]

  def index
    @recipes = @category.present? ? @category.recipes : Recipe.all
  end

  def show
  end

  private

  def set_category
    @category = Category.find(params[:category_id]) if params[:category_id].present?
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
