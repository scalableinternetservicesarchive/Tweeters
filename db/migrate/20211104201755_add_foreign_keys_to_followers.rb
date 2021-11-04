class AddForeignKeysToFollowers < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :followers, :users
  end
end
