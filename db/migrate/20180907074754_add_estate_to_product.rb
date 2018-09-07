class AddEstateToProduct < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :estate, foreign_key: true
  end
end
