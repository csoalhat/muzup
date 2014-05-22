class Comment < ActiveRecord::Base
  attr_accessible :snippet_id, :text, :user_id
  belongs_to :user
  belongs_to :snippet
end
