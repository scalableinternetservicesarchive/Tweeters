class CreateFollowers < ActiveRecord::Migration[6.1]
  def change
    create_table :followers do |t|
      t.integer :users_id
      t.integer :follower_id

      t.timestamps
    end
    add_index :followers, :users_id
  end
end
