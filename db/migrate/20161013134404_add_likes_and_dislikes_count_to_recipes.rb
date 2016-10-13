class AddLikesAndDislikesCountToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :likes_count, :integer, default: 0
    add_column :recipes, :dislikes_count, :integer, default: 0
  end
end
