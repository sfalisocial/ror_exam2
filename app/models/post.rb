class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users_liked, through: :likes, source: :user

  validates :content, length: { minimum: 8 }, presence: true, :on => :create
end
