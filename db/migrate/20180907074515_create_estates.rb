class CreateEstates < ActiveRecord::Migration[5.1]
  def change
    create_table :estates do |t|
      t.string :name

      t.timestamps
    end
  end
end
