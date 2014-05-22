class AddSnippetIdToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :snippet_id, :integer
  end
end
