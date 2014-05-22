class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :file
      t.string :user_id

      t.timestamps
    end
  end
end
