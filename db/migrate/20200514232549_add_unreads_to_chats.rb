class AddUnreadsToChats < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :sender_unreads, :integer
    add_column :chats, :receiver_unreads, :integer
  end
end
