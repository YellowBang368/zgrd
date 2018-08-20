class RenameSenderToSenderId < ActiveRecord::Migration[5.1]
  def change
    rename_column :comments, :sender, :sender_id
  end
end
