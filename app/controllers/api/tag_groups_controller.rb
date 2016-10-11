class API::TagGroupsController < API::APIController
  def index
    @tag_groups = TagGroup.all
  end
end
