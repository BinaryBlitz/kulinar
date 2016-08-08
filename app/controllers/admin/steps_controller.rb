class Admin::StepsController < Admin::AdminController
  before_action :set_recipe, only: [:index, :new, :create]
  before_action :set_step, only: [:show, :edit, :update, :destroy]

  def index
    @steps = @recipe.steps
  end

  def new
    @step = @recipe.steps.build
  end

  def show
  end

  def edit
  end

  def create
    @step = @recipe.steps.build(step_params)

    if @step.save
      redirect_to admin_recipe_steps_path(@recipe), notice: 'Шаг успешно создан.'
    else
      render :new
    end
  end

  def update
    if @step.update(step_params)
      redirect_to admin_recipe_steps_path(@step.recipe), notice: 'Шаг успешно обновлен.'
    else
      render :edit
    end
  end

  def destroy
    @step.destroy
    redirect_to admin_recipe_steps_path(@step.recipe), notice: 'Шаг успешно удален.'
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_step
    @step = Step.find(params[:id])
  end

  def step_params
    params.require(:step).permit(:name, :description, :image, :timer, :position)
  end
end
