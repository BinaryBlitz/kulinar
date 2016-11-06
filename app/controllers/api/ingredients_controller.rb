class API::IngredientsController < API::APIController
  def index
    @ingredients = Ingredient.all
  end
end
