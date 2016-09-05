class RenameSiteToSiteUrlInRestaurants < ActiveRecord::Migration[5.0]
  def change
    rename_column :restaurants, :site, :site_url
  end
end
