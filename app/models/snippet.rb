class Snippet < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :song_id, :pic, :link
  belongs_to :user
  has_many :comments
  belongs_to :song

  mount_uploader :pic, ImageUploader
end
