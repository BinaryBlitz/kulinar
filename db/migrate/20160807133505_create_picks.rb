class CreatePicks < ActiveRecord::Migration[5.0]
  def change
    create_table :picks do |t|
      t.belongs_to :recipe, foreign_key: true
      t.belongs_to :selection, foreign_key: true

      t.timestamps
    end
  end
end
