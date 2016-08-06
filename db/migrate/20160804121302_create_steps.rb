class CreateSteps < ActiveRecord::Migration[5.0]
  def change
    create_table :steps do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :position, null: false
      t.integer :timer
      t.string :image
      t.belongs_to :recipe, foreign_key: true

      t.timestamps
    end
  end
end
