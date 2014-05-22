class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :city
      t.string :inspirations
      t.string :instruments
      t.string :name
      t.string :photo

      t.timestamps
    end
  end
end
