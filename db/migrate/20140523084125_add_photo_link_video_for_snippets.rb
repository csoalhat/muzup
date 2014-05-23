class AddPhotoLinkVideoForSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :pic, :text
    add_column :snippets, :link, :text
    add_column :snippets, :video, :text

  end
end


