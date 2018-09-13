class AddFavoritesIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :favorite_ids, :text, array:true, default: []
  end
end
