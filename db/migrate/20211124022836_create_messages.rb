class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :to_user
      t.integer :from_user

      t.timestamps
    end
  end
end
