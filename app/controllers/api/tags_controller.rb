class API::TagsController < API::APIController
  before_action :set_tag_group, only: [:index]

  def index
    @tags = @tag_group.tags.all
  end

  private

  def set_tag_group
    @tag_group = TagGroup.find(params[:tag_group_id])
  end
end
