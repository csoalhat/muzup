class AddSongIdtoSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :song_id, :integer
  end
end
