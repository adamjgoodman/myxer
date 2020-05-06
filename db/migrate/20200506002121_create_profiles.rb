class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.text :bio
      t.string :location
      t.string :status
      t.integer :user_id
      t.timestamps
    end
    add_index :profiles, :user_id
  end
end
