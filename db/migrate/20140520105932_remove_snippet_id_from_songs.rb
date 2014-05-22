class RemoveSnippetIdFromSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :snippet_id
  end
end
