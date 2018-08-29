class AddParamsToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :gas, :boolean
    add_column :products, :elecricity, :boolean
    add_column :products, :sewerage, :boolean
  end
end
