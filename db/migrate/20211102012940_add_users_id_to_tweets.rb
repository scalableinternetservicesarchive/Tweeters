class AddUsersIdToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :users_id, :integer
    add_index :tweets, :users_id
  end
end
