class User < ActiveRecord::Base
  after_create :create_profile

  has_secure_password
  validates :email, presence: true, uniqueness: true

  attr_accessible :city, :inspirations, :instruments, :name, :photo, :email, :password, :password_confirmation, :profile
  has_many :snippets
  has_many :songs, through: :snippets
  has_many :comments

  has_one  :profile

  def role? role 
    self.role.to_s == role.to_s
  end

  def set_default_role
    if self.role.nil?
      self.role = "user"
    end
  end



end
