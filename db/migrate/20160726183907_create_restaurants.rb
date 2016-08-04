class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :image, null: false
      t.string :icon, null: false
      t.string :address, null: false
      t.string :phone_number, null: false
      t.string :site, null: false
      t.boolean :featured, default: false

      t.timestamps
    end
  end
end
