class RenameElectricityColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :elecricity, :electricity
  end
end
