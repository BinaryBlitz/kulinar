class Admin::RecipesController < Admin::AdminController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def show
  end

  def edit
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to admin_recipes_url, notice: 'Рецепт успешно создан.'
    else
      render 'new'
    end
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to admin_recipes_url, notice: 'Рецепт успешно обновлен.'
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to admin_recipes_url, notice: 'Рецепт успешно удален.'
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params
      .require(:recipe)
      .permit(
        :name, :description, :image, :cooking_time, :calories,
        :proteins, :fats, :carbohydrates, :restaurant_id
      )
  end

end
