class API::TagsController < API::APIController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end
end
