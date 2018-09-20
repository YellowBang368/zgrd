class AddPublicToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :public, :boolean, default: false
  end
end
