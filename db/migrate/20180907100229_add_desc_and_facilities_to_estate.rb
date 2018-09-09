class AddDescAndFacilitiesToEstate < ActiveRecord::Migration[5.1]
  def change
    add_column :estates, :description, :string
    add_column :estates, :facilities, :text, array:true, default: []
  end
end
