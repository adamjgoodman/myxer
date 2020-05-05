class AddUserIdToMyxes < ActiveRecord::Migration[5.2]
  def change
    add_column :myxes, :user_id, :integer
  	add_index :myxes, :user_id
  end
end
