class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :api_token
      t.index :api_token, unique: true

      t.timestamps
    end
  end
end
