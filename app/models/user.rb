class User < ActiveRecord::Base
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true
  has_many :blogs
  has_many :likes, dependent: :destroy
  has_many :blogs_liked, through: :likes, source: :blog
  has_many :comments, dependent: :destroy
  has_many :blogs_commented, through: :comments, source: :blog
end
