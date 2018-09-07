class AddEstateToProductAttachments < ActiveRecord::Migration[5.1]
  def change
    add_reference :product_attachments, :estate, foreign_key: true
  end
end
