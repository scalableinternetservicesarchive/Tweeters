class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :tweet_id

      t.timestamps
    end
    add_index :likes, :user_id
    add_index :likes, :tweet_id
  end
end
