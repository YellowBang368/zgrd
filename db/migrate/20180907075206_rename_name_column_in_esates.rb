class RenameNameColumnInEsates < ActiveRecord::Migration[5.1]
  def change
    rename_column :estates, :name, :title
  end
end
