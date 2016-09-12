class AddLikedCountAndDislikedCountToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :liked_count, :integer, default: 0
    add_column :recipes, :disliked_count, :integer, default: 0
  end
end
