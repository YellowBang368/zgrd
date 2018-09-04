class CreateProductAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :product_attachments do |t|
      t.integer :product_id
      t.string :gallery

      t.timestamps
    end
  end
end
