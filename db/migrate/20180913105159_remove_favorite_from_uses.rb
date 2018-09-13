class RemoveFavoriteFromUses < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :favorite
  end
end
