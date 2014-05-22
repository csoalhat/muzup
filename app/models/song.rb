class Song < ActiveRecord::Base
  attr_accessible :file, :title, :user_id
  belongs_to :user
  has_many :snippets, dependent: :destroy

  mount_uploader :file, SongUploader
end
