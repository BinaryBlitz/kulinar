class CreateTagGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :tag_groups do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
