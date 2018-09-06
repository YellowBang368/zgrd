class AddProToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :pro, :integer
  end
end
