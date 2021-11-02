class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.text :content
      t.integer :likes
      t.integer :comments

      t.timestamps
    end
  end
end
