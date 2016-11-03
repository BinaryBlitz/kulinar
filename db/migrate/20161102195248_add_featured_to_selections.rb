class AddFeaturedToSelections < ActiveRecord::Migration[5.0]
  def change
    add_column :selections, :featured, :boolean, default: false
  end
end
