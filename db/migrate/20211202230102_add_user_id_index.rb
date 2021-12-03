class AddUserIdIndex < ActiveRecord::Migration[6.1]
  def change
    add_index :messages, :to_user
    add_index :messages, :from_user
  end
end
