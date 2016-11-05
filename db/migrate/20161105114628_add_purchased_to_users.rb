class AddPurchasedToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :purchased, :boolean, default: false
  end
end
