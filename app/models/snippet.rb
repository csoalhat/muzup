class Snippet < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :song_id
  belongs_to :user
  has_many :comments
  belongs_to :song
end
