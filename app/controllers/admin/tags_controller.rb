class Admin::TagsController < Admin::AdminController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def show
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admin_tags_url, notice: 'Тег успешно создан.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      redirect_to admin_tags_url, notice: 'Тег успешно обновлен.'
    else
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to admin_tags_url, notice: 'Тег успешно удален.'
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end