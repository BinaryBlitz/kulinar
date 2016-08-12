class Admin::SelectionsController < Admin::AdminController
  before_action :set_selection, only: [:show, :edit, :update, :destroy]

  def index
    @selections = Selection.all
  end

  def show
  end

  def new
    @selection = Selection.new
  end

  def create
    @selection = Selection.new(selection_params)
    if @selection.save
      redirect_to admin_selections_url, notice: 'Подборка успешно создана.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @selection.update(selection_params)
      redirect_to admin_selections_url, notice: 'Подборка успешно обновлена.'
    else
      render :edit
    end
  end

  def destroy
    @selection.destroy
    redirect_to admin_selections_url, notice: 'Подборка успешно удалена.'
  end

  private

  def set_selection
    @selection = Selection.find(params[:id])
  end

  def selection_params
    params
      .require(:selection)
      .permit(
        :name, :description, :image, :starts_at,
        picks_attributes: [:recipe_id, :_destroy, :id]
      )
  end
end
