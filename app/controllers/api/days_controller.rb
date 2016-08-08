class API::DaysController < API::APIController
  def index
    @days = Day.all
  end

  def show
    @day = Day.find(params[:id])
  end
end
