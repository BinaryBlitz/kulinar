class AddUseImageAsRecipeCoverToSteps < ActiveRecord::Migration[5.0]
  def change
    add_column :steps, :use_image_as_recipe_cover, :boolean, default: false
  end
end
