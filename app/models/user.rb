class User < ActiveRecord::Base
  has_secure_password
  has_many :likes
  has_many :posts , dependent: :destroy
  has_many :posts_liked, through: :likes, source: :post

  validates :name, :alias, presence: true, :on => :create, length: { minimum: 2 }
  validates :password, presence: true, :on => :create, length: { minimum: 8 }
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
