class CreateMyxes < ActiveRecord::Migration[5.2]
  def change
    create_table :myxes do |t|
      t.text :message
      t.timestamps
    end
  end
end
