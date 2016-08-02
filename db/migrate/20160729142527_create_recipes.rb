class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :cooking_time, null: false
      t.string :image, null: false
      t.float :calories, null: false
      t.float :proteins, null: false
      t.float :fats, null: false
      t.float :carbohydrates, null: false
      t.belongs_to :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
