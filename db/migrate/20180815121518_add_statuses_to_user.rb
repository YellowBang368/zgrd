class AddStatusesToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :confirmed, :boolean
    add_column :users, :status, :integer
  end
end
