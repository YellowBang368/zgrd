class AddMainInfoToEstate < ActiveRecord::Migration[5.1]
  def change
    add_column :estates, :year, :string
    add_column :estates, :estate_class, :string
  end
end
