class AddPublicToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :public, :boolean, default: true
  end
end
