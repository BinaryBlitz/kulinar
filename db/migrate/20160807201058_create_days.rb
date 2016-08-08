class CreateDays < ActiveRecord::Migration[5.0]
  def change
    create_table :days do |t|
      t.datetime :starts_at, null: false
      t.belongs_to :recipe, foreign_key: true

      t.timestamps
    end
  end
end
