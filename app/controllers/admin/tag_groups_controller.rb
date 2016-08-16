class Admin::TagGroupsController < Admin::AdminController
  before_action :set_tag_group, only: [:show, :edit, :update, :destroy]

  def index
    @tag_groups = TagGroup.all
  end

  def show
  end

  def new
    @tag_group = TagGroup.new
  end

  def create
    @tag_group = TagGroup.new(tag_group_params)
    if @tag_group.save
      redirect_to admin_tag_groups_url, notice: 'Группа тегов успешно создана.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tag_group.update(tag_group_params)
      redirect_to admin_tag_groups_url, notice: 'Группа тегов успешно обновлена.'
    else
      render :edit
    end
  end

  def destroy
    @tag_group.destroy
    redirect_to admin_tag_groups_url, notice: 'Группа тегов успешно удалена.'
  end

  private

  def set_tag_group
    @tag_group = TagGroup.find(params[:id])
  end

  def tag_group_params
    params.require(:tag_group).permit(:name, tags_attributes: [:id, :name, :_destroy])
  end
end
