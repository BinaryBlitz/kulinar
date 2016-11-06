class Admin::IngredientsController < Admin::AdminController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    @ingredients = Ingredient.all
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to admin_ingredients_url, notice: 'Ингредиент успешно создан.'
    else
      render 'new'
    end
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to admin_ingredients_url, notice: 'Ингредиент успешно обновлен.'
    else
      render :edit
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to admin_ingredients_url, notice: 'Ингредиент успешно удален.'
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
