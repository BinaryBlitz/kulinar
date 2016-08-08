class Admin::DaysController < Admin::AdminController
  before_action :set_day, only: [:show, :edit, :update, :destroy]

  def index
    @days = Day.all
  end

  def show
  end

  def new
    @day = Day.new
  end

  def edit
  end

  def create
    @day = Day.new(day_params)
    if @day.save
      redirect_to admin_days_url, notice: 'Рецепт дня был успешно создан.'
    else
      render :new
    end
  end

  def update
    if @day.update(day_params)
      redirect_to admin_days_url, notice: 'Рецепт дня успешно обновлен.'
    else
      render :edit
    end
  end

  def destroy
    @day.destroy
    redirect_to admin_days_url, notice: 'Рецепт дня был успешно удален.'
  end

  private

  def set_day
    @day = Day.find(params[:id])
  end

  def day_params
    params.require(:day).permit(:starts_at, :recipe_id)
  end
end
