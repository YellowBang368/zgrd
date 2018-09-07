class DestroyEstates < ActiveRecord::Migration[5.1]
  def change
    drop_table :estates
  end
end
