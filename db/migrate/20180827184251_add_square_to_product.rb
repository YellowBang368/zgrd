class AddSquareToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :square, :real
  end
end
