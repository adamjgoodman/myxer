class AddUsernameToChats < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :receiver_username, :string
  end
end
