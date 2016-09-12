class API::RatingsController < API::APIController
  before_action :set_recipe, only: [:index, :create]
  before_action :set_rating, only: [:update, :destroy]

  def create
    @rating = @recipe.ratings.build(rating_params)
    @rating.user = current_user

    if @rating.save
      render status: :created
    else
      render json: @rating.errors, status: 422
    end
  end

  def update
    if @rating.update(rating_params)
      head :ok
    else
      render json: @rating.errors, status: 422
    end
  end

  def destroy
    @rating.destroy
    head :no_content
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_rating
    @rating = Rating.find(params[:id])
  end

  def rating_params
    params.require(:rating).permit(:value)
  end
end
