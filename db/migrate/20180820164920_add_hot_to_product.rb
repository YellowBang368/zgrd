class AddHotToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :hot, :boolean
  end
end
