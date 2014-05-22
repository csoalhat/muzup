class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :city
      t.text :inspirations
      t.string :photo
      t.string :instruments

      t.timestamps
    end
  end
end
