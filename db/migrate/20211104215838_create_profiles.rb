class CreateProfiles < ActiveRecord::Migration[6.1]
    def change
      create_table :profiles do |t|
        t.string :first_name
        t.string :last_name
        t.text :bio
        t.date :joined
        t.string :location
  
        t.timestamps
      end
    end
  end