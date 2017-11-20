class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :title, null: false
      t.string :artist, null: false
      t.integer :user_id

      t.timestamps
    end
  end
end
