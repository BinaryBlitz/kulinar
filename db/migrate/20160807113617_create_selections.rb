class CreateSelections < ActiveRecord::Migration[5.0]
  def change
    create_table :selections do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :image, null: false
      t.datetime :starts_at, null: false

      t.timestamps
    end
  end
end
