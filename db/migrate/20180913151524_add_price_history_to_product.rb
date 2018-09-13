class AddPriceHistoryToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :price_history, :text
  end
end
