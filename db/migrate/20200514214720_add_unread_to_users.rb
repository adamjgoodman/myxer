class AddUnreadToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :unread, :integer
  end
end
