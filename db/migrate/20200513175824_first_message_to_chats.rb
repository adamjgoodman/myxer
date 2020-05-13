class FirstMessageToChats < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :first_message, :text
  end
end
