class Profile < ActiveRecord::Base
  attr_accessible :city, :inspirations, :instruments, :name, :user, :photo
  belongs_to :user

  mount_uploader :photo, ImageUploader
end
