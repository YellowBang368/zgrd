class AddFavoriteToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :favorite, :integer, array: true
  end
end
