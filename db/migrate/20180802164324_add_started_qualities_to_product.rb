class AddStartedQualitiesToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :name, :string
    add_column :products, :description, :string
    add_column :products, :price, :integer
  end
end
