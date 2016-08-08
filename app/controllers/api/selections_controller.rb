class API::SelectionsController < API::APIController
  def index
    @selections = Selection.latest
  end

  def show
    @selection = Selection.find(params[:id])
  end
end
